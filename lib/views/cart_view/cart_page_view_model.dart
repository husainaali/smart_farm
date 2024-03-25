import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_farm/models/categories_and_items.dart';

import '../../constants/strings.dart';
import '../../services/locator_service.dart';
import '../../services/shared_preferences_service.dart';
import '../../view_models/base_model.dart';

class CartPageViewModel extends BaseModel {
  String? userData;

  final SharedPreferenceService _sharedPreferenceService =
      locator.get<SharedPreferenceService>();
  List<ItemsList> itemList = [
    ItemsList(
        3,
        'Orange',
        'Oranges are a citrus fruit known for their bright color, juicy flesh, and tangy flavor. They are packed with vitamin C and other antioxidants, making them a healthy addition to your diet.',
        'assets/orange.png',
        130,
        2),
    ItemsList(
        4,
        'Strawberry',
        'Strawberries are sweet, red berries with a juicy texture and refreshing taste. They are high in vitamin C, fiber, and antioxidants, making them a nutritious choice for snacks and desserts.',
        'assets/strawberry.png',
        40,
        1),
    ItemsList(
        5,
        'Mango',
        'Mangoes are tropical fruits with a sweet and tangy flavor. They are rich in vitamins A and C, as well as antioxidants like beta-carotene. Mangoes can be eaten fresh, dried, or blended into smoothies.',
        'assets/mango.png',
        40,
        3),
  ];
  initialize() async {
    setBusy(true);
    userData = await _sharedPreferenceService.getStringData(AppString.userData);
    setBusy(false);
  }
}
