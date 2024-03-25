
import 'dart:async';

import 'package:flutter/material.dart';

import '../../services/locator_service.dart';
import '../../services/shared_preferences_service.dart';
import '../../view_models/base_model.dart';


class SettingPageViewModel extends BaseModel {
  final SharedPreferenceService sharedPreferenceServiceSetting =
      locator.get<SharedPreferenceService>();
      initialize() {}

      

}