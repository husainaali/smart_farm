import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:smart_farm/constants/constants_helper.dart';
import 'package:smart_farm/models/categories_and_items.dart';
import 'package:smart_farm/widgets/custom_widget_helper.dart';
import 'package:stacked/stacked.dart';

import 'home_page_view_model.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
        viewModelBuilder: () => HomePageViewModel(),
        onViewModelReady: (model) => model.initialize(),
        builder: (context, model, child) => Scaffold(
            backgroundColor: Colors.white,
            appBar: customShortAppBar(context,
                parentPage: 'customer_home',
                resources: customCustomerHome(context, model)),
            body: SafeArea(
                child: GridView.builder(
              padding: EdgeInsets.only(left: 15, right: 15),
              semanticChildCount: 2,
              itemCount:
                  model.categoriesList[model.catSelected].itemsList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                var itemsList =
                    model.categoriesList[model.catSelected].itemsList;

                return customItemWidget(context, model, index, itemsList);
              },
            ))));
  }

  customCustomerHome(context, HomePageViewModel model) {
    return SizedBox(
      height: customHeight(context, percentage: 0.13),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: model.categoriesList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Transform.scale(
              scale: model.catSelected == index ? 1.0 : 0.83,
              child: GestureDetector(
                onTap: () {
                  model.catSelected = index;
                  model.notifyListeners();
                  print('aaa');
                },
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 15,
                            offset: Offset(0, 12),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(
                                  model.catSelected == index ? 0.0 : 0.7),
                              BlendMode.saturation),
                          child: Image.asset(
                            model.categoriesList[index].imagePath!,
                            fit: BoxFit.fitWidth,
                            width: customWidth(context, percentage: 0.3),
                            height: customHeight(context, percentage: 0.08),
                          ),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: LimitedBox(
                          maxWidth: customWidth(context, percentage: 0.3),
                          child: AutoSizeText(
                            model.categoriesList[index].catName!,
                            maxLines: 1,
                            maxFontSize: 14,
                            minFontSize: 4,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

customItemWidget(
    context, HomePageViewModel model, index, List<ItemsList> itemsList) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: customHeight(context, percentage: 0.5),
      width: customWidth(context, percentage: 0.4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColor.appColorWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 15,
              offset: Offset(0, 12),
            ),
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
            child: Image.asset(
              fit: BoxFit.cover,
              height: customHeight(context, percentage: 0.12),
              model.categoriesList[model.catSelected].itemsList[index].imagePath!,
              // model.categoriesList[model.catSelected]
              //         .itemsList[index].imagePath ??
              //     '',
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: LimitedBox(
                  maxWidth: customWidth(context, percentage: 0.3),
                  maxHeight: customHeight(context, percentage: 0.2),
                  child: AutoSizeText(
                    maxFontSize: 15,
                    minFontSize: 6,
                    model.categoriesList[model.catSelected].itemsList[index]
                            .itemName ??
                        '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: LimitedBox(
                  maxWidth: customWidth(context, percentage: 0.3),
                  maxHeight: customHeight(context, percentage: 0.2),
                  child: AutoSizeText(
                    maxFontSize: 15,
                    minFontSize: 10,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    model.categoriesList[model.catSelected].itemsList[index]
                            .itemDiscreption ??
                        '',
                    style: TextStyle(fontWeight: FontWeight.w100),
                  )),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.scale(
                scale: 0.7,
                child: ColoredBox(
                  color: AppColor.appColorBlack,
                  child: SizedBox(
                    height: customHeight(context, percentage: 0.04),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            color: AppColor.appColorBlack,
                            onPressed: () {
                              print('object-');
                              ItemsList tempItemList = ItemsList(
                                  itemsList[index].itemID,
                                  itemsList[index].itemName,
                                  itemsList[index].itemDiscreption,
                                  itemsList[index].imagePath,
                                  itemsList[index].price,
                                  itemsList[index].itemQty);
                              if (model.itemListForQty.any((element) =>
                                  element.itemID == tempItemList.itemID &&element.itemQty>0)) {
                                model.itemListForQty[index].itemQty =
                                    model.itemListForQty[index].itemQty - 1;
                              } else {
                                model.itemListForQty.remove(tempItemList);
                              }
                              print(model.itemListForQty[index].itemQty);
                              model.notifyListeners();
                            },
                            icon: Icon(
                              Icons.remove,
                              color: AppColor.appColorWhite,
                              size: 15,
                            )),
                        Container(
                          height: customHeight(context, percentage: 0.03),
                          width: customWidth(context, percentage: 0.09),
                          decoration: BoxDecoration(
                            color: AppColor.appColorWhite,
                          ),
                          child: Center(
                              child: Text(model.itemListForQty.any((element) =>
                                      element.itemID == itemsList[index].itemID)
                                  ? '${model.itemListForQty[index].itemQty}'
                                  : '0')),
                        ),
                        IconButton(
                            color: AppColor.appColorBlack,
                            onPressed: () {
                              print('object+');
                              ItemsList? tempItemList;
                              tempItemList=null;
                               tempItemList = ItemsList(
                                  itemsList[index].itemID,
                                  itemsList[index].itemName,
                                  itemsList[index].itemDiscreption,
                                  itemsList[index].imagePath,
                                  itemsList[index].price,
                                  itemsList[index].itemQty);
                              if (model.itemListForQty.any((element) =>
                                  element.itemID == tempItemList!.itemID)) {
                                model.itemListForQty[index].itemQty =
                                    model.itemListForQty[index].itemQty + 1;
                              } else {
                                tempItemList.itemQty = 1;
                                model.itemListForQty.add(tempItemList);
                              }
                              print(model.itemListForQty[index].itemQty);
                              model.notifyListeners();
                            },
                            icon: Icon(
                              Icons.add,
                              color: AppColor.appColorWhite,
                              size: 15,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              ColoredBox(
                color: AppColor.appColorOliveGreen,
                child: SizedBox(
                  height: customHeight(context, percentage: 0.04),
                  width: customWidth(context, percentage: 0.25),
                  child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart,
                              size: 18, color: AppColor.appColorWhite),
                          Gap(5),
                          LimitedBox(
                              maxHeight: 0.04,
                              child: AutoSizeText(
                                  minFontSize: 12,
                                  maxFontSize: 14,
                                  '${model.categoriesList[model.catSelected].itemsList[index].price}',
                                  style: TextStyle(
                                      color: AppColor.appColorWhite,
                                      fontWeight: FontWeight.bold)))
                        ],
                      )),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
