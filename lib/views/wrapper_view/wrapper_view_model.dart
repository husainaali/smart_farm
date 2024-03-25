import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:smart_farm/routes/routes.dart';
import 'package:smart_farm/views/cart_view/cart_page_view.dart';
import 'package:smart_farm/views/login_view/login_page_view.dart';
import 'package:smart_farm/views/wrapper_view/wrapper_view.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

import '../../constants/strings.dart';
import '../../models/categories_and_items.dart';
import '../../models/user.dart';
import '../../services/locator_service.dart';
import '../../services/shared_preferences_service.dart';
import '../../view_models/base_model.dart';
import '../home_manager/home_manager_page_view.dart';
import '../home_view/home_page_view.dart';

class WrapperViewModel extends BaseModel {

  int navSelectedItem = 1;

  int cartItemNo = 2;

String? userData;

  final SharedPreferenceService _sharedPreferenceService =
      locator.get<SharedPreferenceService>();

  Widget? selectedPage = HomeManagerPageView();

  final ReactiveValue<List<ItemsList>> _itemsList = ReactiveValue([]);
  List<ItemsList> get itemsList => _itemsList.value;


  void initialize(BuildContext context) async {
    setBusy(true);
    userData =
        await _sharedPreferenceService.getStringData(AppString.userData);
  
      if (userData != null && userData != "") {
        if (userData == 'User') {
          selectedPage = const HomePageView();
          navSelectedItem = 1;
        } else if (userData == 'Manager') {
          selectedPage = const HomeManagerPageView();
          navSelectedItem = 1;
        }
      }else{
          selectedPage = const LoginPageView();
        navSelectedItem = 5;
      }

      setBusy(false);
      notifyListeners();
    
  }

  Future<void> changePage(BuildContext context) async {
    context.go(WrapperRoute.path);
    notifyListeners();
  }
}
