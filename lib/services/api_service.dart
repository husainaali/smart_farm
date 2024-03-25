import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../constants/constants_helper.dart';

// import '../models/multi_part_request.dart';

class ApiService {
  final String appBaseUrl = AppConfig.appBaseUrl;

  Future<Response> foryouGetData(String url) async {
    try {
      Response response = await getData(
        Uri.parse(appBaseUrl + url),
      );
      return response;
    } catch (e) {
      return Response(e.toString(), 1);
    }
  }

  Future<Response> foryouPostData(
    String url,
    dynamic body,
  ) async {
    try {
      Response response = await postData(
        Uri.parse(appBaseUrl + url),
        body,
      );
      return response;
    } catch (e) {
      return Response(e.toString(), 1);
    }
  }

  Future<Response> getData(Uri uri, {Map<String, String>? headers}) async {
    try {
      Response response = await get(
        uri,
        headers: headers,
      );
      return response;
    } catch (e) {
      return Response(e.toString(), 1);
    }
  }

  Future<Response> postData(
    Uri uri,
    dynamic body,
  ) async {
    try {
      Response response = await post(
        uri,
        body: jsonEncode(body),
      );
      return response;
    } catch (e) {
      return Response(e.toString(), 1);
    }
  }
}
