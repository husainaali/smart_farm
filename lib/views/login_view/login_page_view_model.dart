
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/locator_service.dart';
import '../../services/shared_preferences_service.dart';
import '../../view_models/base_model.dart';


class LoginPageViewModel extends BaseModel {
  bool isLoginPage =true;

  final SharedPreferenceService sharedPreferenceService =
      locator.get<SharedPreferenceService>();
    TextEditingController textControllerUserFullName = TextEditingController();
  TextEditingController textControllerUserCPR = TextEditingController();
  TextEditingController textControllerUserOccupation = TextEditingController();
  TextEditingController textControllerUserDOB = TextEditingController();
  TextEditingController textControllerUserAddress = TextEditingController();
  TextEditingController textControllerUserContactNo1 = TextEditingController();
  TextEditingController textControllerUserContactNo2 = TextEditingController();
  TextEditingController textControllerUserEmail = TextEditingController();
  TextEditingController textControllerUserPassword = TextEditingController();


      initialize() {


      }

      

}