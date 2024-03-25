import 'dart:async';

import 'package:flutter/material.dart';

import '../../models/categories_and_items.dart';
import '../../services/locator_service.dart';
import '../../view_models/base_model.dart';
import '../wrapper_view/wrapper_view.dart';

class HomeManagerPageViewModel extends BaseModel {
  int catSelected = 0;
  final WrapperView wrapperView = locator.get<WrapperView>();
  List<ItemsList> itemListForQty = [];
  List<CategoriesList> categoriesList = [
    CategoriesList(1, 'Fruits', 'assets/fruit.png', [
      ItemsList(
          1,
          'Apple',
          'Fresh, juicy, and crisp, apples are one of the most popular fruits worldwide. They come in various colors and flavors, making them versatile for snacking, baking, and cooking.',
          'assets/apple.png',
          100,
          0),
      ItemsList(
          2,
          'Banana',
          'Bananas are a delicious and nutritious fruit with a distinctive sweet taste and creamy texture. They are rich in essential nutrients such as potassium, vitamin C, and vitamin B6.',
          'assets/banana.png',
          120,
          0),
      ItemsList(
          3,
          'Orange',
          'Oranges are a citrus fruit known for their bright color, juicy flesh, and tangy flavor. They are packed with vitamin C and other antioxidants, making them a healthy addition to your diet.',
          'assets/orange.png',
          130,
          0),
      ItemsList(
          4,
          'Strawberry',
          'Strawberries are sweet, red berries with a juicy texture and refreshing taste. They are high in vitamin C, fiber, and antioxidants, making them a nutritious choice for snacks and desserts.',
          'assets/strawberry.png',
          40,
          0),
      ItemsList(
          5,
          'Mango',
          'Mangoes are tropical fruits with a sweet and tangy flavor. They are rich in vitamins A and C, as well as antioxidants like beta-carotene. Mangoes can be eaten fresh, dried, or blended into smoothies.',
          'assets/mango.png',
          40,
          0),
    ]),
    CategoriesList(2, 'Vegetables', 'assets/vegetables.png', [
      ItemsList(
          6,
          'Tomato',
          'Tomatoes are a versatile vegetable used in many cuisines worldwide. They are rich in vitamins, minerals, and antioxidants, making them beneficial for overall health. Tomatoes can be eaten raw, cooked, or processed into sauces and soups.',
          'assets/tomato.png',
          90,
          0),
      ItemsList(
          7,
          'Carrot',
          'Carrots are crunchy root vegetables with a sweet and earthy flavor. They are high in beta-carotene, fiber, and vitamins, making them excellent for eye health and overall well-being.',
          'assets/vegetables.png',
          40,
          0),
      ItemsList(
          8,
          'Spinach',
          'Spinach is a nutrient-rich leafy green vegetable with a mild taste and tender texture. It is an excellent source of vitamins, minerals, and antioxidants, promoting heart health, bone health, and more.',
          'assets/vegetables.png',
          300,
          0),
      ItemsList(
          9,
          'Broccoli',
          'Broccoli is a cruciferous vegetable known for its vibrant green color and unique flavor. It is packed with vitamins, minerals, and antioxidants, offering numerous health benefits such as improved digestion and reduced inflammation.',
          'assets/vegetables.png',
          1.49,
          0),
      ItemsList(
          10,
          'Bell pepper',
          'Bell peppers, also known as sweet peppers, come in various colors and flavors, including red, yellow, orange, and green. They are rich in vitamin C, vitamin A, and antioxidants, supporting immune function and skin health.',
          'assets/vegetables.png',
          30,
          0),
    ]),
    CategoriesList(3, 'Herbs', 'assets/herps.png', [
      ItemsList(
          11,
          'Basil',
          'Basil is a fragrant herb with a sweet and peppery flavor. It is commonly used in Italian cuisine, particularly in pesto sauce and salads. Basil is rich in essential oils and antioxidants, offering various health benefits.',
          'assets/herps.png',
          90,
          0),
      ItemsList(
          12,
          'Mint',
          'Mint is a refreshing herb with a cool and invigorating flavor. It is often used in teas, beverages, and desserts for its refreshing taste and digestive properties. Mint leaves are rich in antioxidants and essential oils.',
          'assets/herps.png',
          0.79,
          0),
      ItemsList(
          12,
          'Rosemary',
          'Rosemary is a fragrant herb with a woody and pine-like aroma. It is commonly used in Mediterranean cuisine, particularly with roasted meats, potatoes, and bread. Rosemary is rich in antioxidants and has antimicrobial properties.',
          'assets/herps.png',
          30,
          0),
      ItemsList(
          13,
          'Thyme',
          'Thyme is a versatile herb with a subtle and earthy flavor. It is used in various culinary dishes, including soups, stews, and sauces. Thyme contains essential oils and antioxidants that provide numerous health benefits.',
          'assets/herps.png',
          50,
          0),
      ItemsList(
          14,
          'Parsley',
          'Parsley is a bright green herb with a fresh and slightly peppery flavor. It is often used as a garnish or ingredient in salads, sauces, and soups. Parsley is rich in vitamins, minerals, and antioxidants, promoting overall health.',
          'assets/herps.png',
          190,
          0),
    ]),
    CategoriesList(4, 'Flowers', 'assets/flowers.png', [
      ItemsList(
          15,
          'Rose',
          'Roses are classic flowers known for their beauty, fragrance, and symbolism. They come in various colors and are often given as gifts for special occasions like weddings, anniversaries, and Valentine\'s Day.',
          'assets/flowers.png',
          300,
          0),
      ItemsList(
          16,
          'Sunflower',
          'Sunflowers are vibrant and cheerful flowers with large, yellow blooms and dark centers. They are a symbol of positivity, happiness, and vitality. Sunflowers are often grown for their seeds, which are nutritious and delicious.',
          'assets/flowers.png',
          70,
          80),
      ItemsList(
          17,
          'Tulip',
          'Tulips are elegant flowers with cup-shaped blooms and long, slender stems. They come in a variety of colors and are popular for their beauty and grace. Tulips are often associated with springtime and new beginnings.',
          'assets/flowers.png',
          100,
          0),
      ItemsList(
          18,
          'Orchid',
          'Orchids are exotic and elegant flowers known for their intricate blooms and long-lasting beauty. They come in a wide range of colors, shapes, and sizes, making them a favorite choice for floral arrangements and indoor decor.',
          'assets/flowers.png',
          110,
          0),
      ItemsList(
          19,
          'Daisy',
          'Daisies are cheerful and simple flowers with white petals and yellow centers. They symbolize purity, innocence, and new beginnings, making them popular for bouquets, weddings, and garden borders.',
          'assets/flowers.png',
          130,
          0),
    ]),
    CategoriesList(5, 'Trees', 'assets/trees.png', [
      ItemsList(
          20,
          'Oak',
          'Oak trees are majestic hardwood trees known for their strength, durability, and longevity. They are native to many regions worldwide and are valued for their timber, shade, and wildlife habitat. Oak trees symbolize endurance, wisdom, and resilience.',
          'assets/trees.png',
          100,
          0),
      ItemsList(
          21,
          'Pine',
          'Pine trees are evergreen conifers with needle-like leaves and woody cones. They are found in diverse environments, from forests to mountains, and are valued for their timber, resin, and ornamental beauty. Pine trees symbolize immortality, growth, and renewal.',
          'assets/trees.png',
          80,
          0),
      ItemsList(
          22,
          'Maple',
          'Maple trees are deciduous trees known for their vibrant autumn colors, distinctive leaves, and sweet sap. They are native to North America, Europe, and Asia and are valued for their wood, syrup, and ornamental value. Maple trees symbolize balance, abundance, and unity.',
          'assets/trees.png',
          120,
          0),
      ItemsList(
          23,
          'Palm',
          'Palm trees are tropical and subtropical trees known for their iconic silhouette, fan-shaped leaves, and resilience to harsh climates. They are found in coastal regions worldwide and are valued for their beauty, shade, and economic importance. Palm trees symbolize peace, victory, and triumph.',
          'assets/trees.png',
          150,
          0),
      ItemsList(
          24,
          'Birch',
          'Birch trees are deciduous trees known for their striking white bark, slender branches, and delicate leaves. They are native to temperate regions of the Northern Hemisphere and are valued for their wood, sap, and ornamental appeal. Birch trees symbolize renewal, purification, and new beginnings.',
          'assets/trees.png',
          150,
          0),
    ])
  ];

  initialize() {}

  int getItemsListLength(int index) {
    if (index >= 0 && index < categoriesList.length) {
      return categoriesList[index].itemsList.length;
    }
    // Return 0 if the index is out of bounds or categoriesList is empty
    return 0;
  }
}

Widget customItemWidget() {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
  );
}
