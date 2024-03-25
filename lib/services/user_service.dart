import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_farm/services/locator_service.dart';
import 'package:stacked/stacked.dart';
import '../constants/constants_helper.dart';

import 'package:http/http.dart' as http;

import '../constants/strings.dart';
import '../models/user.dart';
import 'api_service.dart';
import 'shared_preferences_service.dart';

class UserService {
  ApiService apiService = locator.get<ApiService>();
  final SharedPreferenceService _sharedPreferenceService =
      locator.get<SharedPreferenceService>();
  // final ReactiveValue<List<Employee>> _employee = ReactiveValue([]);
  // List<Employee>? get employee => _employee.value;
  Future<bool> loginUser(context, String username, String password) async {
    final String apiUrl = AppConfig.appBaseUrl + AppConfig.getUserData;

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'username': username,
          'password': password,
        },
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print('Response data: $responseData');

        if (responseData != null && responseData['success'] == true) {
          await _sharedPreferenceService.saveData(
              AppString.isUserLogInKey, true);

          await _sharedPreferenceService.saveData(
              AppString.userData, json.encode(responseData['user_data']));

          return true;
        } else {
          throw Exception(
              responseData['error'] ?? 'Unknown error'); // Login failed
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please try again!'),
          backgroundColor: AppColor.appColorOliveGreen,
        ));
        throw Exception('Failed to login'); // HTTP request failed
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please try again!'),
        backgroundColor: AppColor.appColorOliveGreen,
      ));
      print('Error: $e'); // Handle error here
      return false;
    }
  }

  Future<bool> registerUser(User userData) async {
    final String apiUrl = AppConfig.appBaseUrl + AppConfig.newRegister;
    if(userData.email!=null){
    int atIndex = userData.email!.indexOf('@');
    String username = userData.email!.substring(0, atIndex);
    userData.userName = username;
    }

    // Define additional variables based on the user's role
    String additionalData = '';
    switch (userData.role) {
      case 'User':
        additionalData = '&occupation=${userData.occupation}';
        break;
      case 'Manager':
        additionalData =
            '&commercial_name=${userData.commercialName}&commercial_id=${userData.commercialID}&company_size=${userData.companySize}';
        break;
      case 'Employee':
      int isActive =userData.isActive==true?1:0;
        additionalData =
            '&manager_id=${userData.managerId}&isActive=$isActive';
        break;
      default:
        throw Exception('Invalid role');
    }

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'username': userData.userName ?? '',
          'password': userData.password ?? '',
          'email': userData.email ?? '',
          'fullName': userData.fullName ?? '',
          'address': userData.address ?? '',
          'contact1': userData.contactNo1 ?? '',
          'contact2': userData.contactNo2 ?? '',
          'role': userData.role ?? "",
          'identityNo': userData.identityNo ?? '',
        }..addAll(Uri.splitQueryString(additionalData)),
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print('Response data: $responseData');

        if (responseData != null && responseData['success'] == true) {
          return true; // Registration successful
        } else {
          throw Exception(
              responseData['error'] ?? 'Unknown error'); // Registration failed
        }
      } else {
        throw Exception('Failed to register user'); // HTTP request failed
      }
    } catch (e) {
      print('Error: $e'); // Handle error here
      return false;
    }
  }


  //   Future<void> getEmployees(managerId) async {
  //     _employee.value =[];
  //   final String apiUrl = AppConfig.appBaseUrl + AppConfig.getEmployeesForManager;
  //   final response = await http.post(
  //     Uri.parse(apiUrl),
  //     body: {
  //       'manager_id': '$managerId'
  //     },
  //   );
  //   if (response.statusCode == 200) {
  //     final List<dynamic> data = jsonDecode(response.body);
  //       _employee.value = data.map((e) => Employee.fromJson(e)).toList();
  //   } else {
  //     throw Exception('Failed to load employees list');
  //   }
  // }
}
