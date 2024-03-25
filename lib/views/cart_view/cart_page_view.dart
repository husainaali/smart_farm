import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';

import '../../constants/constants_helper.dart';
import '../../models/categories_and_items.dart';
import '../../widgets/custom_widget_helper.dart';
import 'cart_page_view_model.dart';

class CartPageView extends StatelessWidget {
  const CartPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartPageViewModel>.reactive(
        viewModelBuilder: () => CartPageViewModel(),
        onViewModelReady: (model) => model.initialize(),
        builder: (context, model, child) => model.busy
            ? customLoading()
            : Scaffold(
                appBar: customShortAppBar(context),
                backgroundColor: Colors.white,
                body: SafeArea(
                    child: ListView(children: [
                  if (model.userData == 'Manager')
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.appColorOliveGreen,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100),
                              topRight: Radius.circular(100))),
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: customWidth(context, percentage: 0.15),
                              right: customWidth(context, percentage: 0.15),
                              top: customHeight(context, percentage: 0.08)),
                          child: customCustomerInfo()),
                    ),
                  Column(
                    children: List.generate(
                        2, (index) => customItemWidget(context, model, index)),
                  ),
                  if (model.userData == 'Manager')
                  SizedBox(
                    width: customWidth(context, percentage: 0.8),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(
                                  AppColor.appColorBlack),
                              overlayColor: MaterialStateProperty.all(
                                  AppColor.appColorWhite.withOpacity(0.5)),
                              backgroundColor: MaterialStateProperty.all(
                                  AppColor.appColorOliveGreen),
                              elevation: MaterialStateProperty.all(50)),
                          onPressed: () {},
                          child: Text(
                           model.userData == 'User'?"Place order": "Confirm",
                            style: TextStyle(color: AppColor.appColorWhite),
                          )),
                    ),
                  ),
                  Gap(10),
                  if (model.userData == 'User') customCustomerInfo(),
                  if (model.userData == 'Manager')
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.appColorOliveGreen,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100),
                              topRight: Radius.circular(100))),
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: customWidth(context, percentage: 0.15),
                              right: customWidth(context, percentage: 0.15),
                              top: customHeight(context, percentage: 0.08)),
                          child: customCustomerInfo()),
                    ),
                  if (model.userData == 'Manager')
                    Column(
                      children: List.generate(2,
                          (index) => customItemWidget(context, model, index)),
                    ),
                  Gap(10),
                  SizedBox(
                    width: customWidth(context, percentage: 0.8),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(
                                  AppColor.appColorBlack),
                              overlayColor: MaterialStateProperty.all(
                                  AppColor.appColorWhite.withOpacity(0.5)),
                              backgroundColor: MaterialStateProperty.all(
                                  AppColor.appColorOliveGreen),
                              elevation: MaterialStateProperty.all(50)),
                          onPressed: () {},
                          child: Text(
                           model.userData == 'User'?"Place order": "Confirm",
                            style: TextStyle(color: AppColor.appColorWhite),
                          )),
                    ),
                  ),
                ]))));
  }
}

customItemWidget(context, CartPageViewModel model, index) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: customHeight(context, percentage: 0.22),
      width: customWidth(context, percentage: 0.95),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColor.appColorWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 15,
              offset: const Offset(0, 12),
            ),
          ]),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                fit: BoxFit.cover,
                height: customHeight(context, percentage: 0.12),
                width: customWidth(context, percentage: 0.32),
                model.itemList[index].imagePath!,
                // model.categoriesList[model.catSelected]
                //         .itemsList[index].imagePath ??
                //     '',
              ),
            ),
          ),
          SizedBox(
            width: customWidth(context, percentage: 0.55),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          model.itemList[index].itemName!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
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
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          model.itemList[index].itemDiscreption!,
                          style: TextStyle(fontWeight: FontWeight.w100),
                        )),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: customWidth(context, percentage: 0.4),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              height: customHeight(context, percentage: 0.04),
                              width: customWidth(context, percentage: 0.19),
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      LimitedBox(
                                          maxHeight: 0.04,
                                          child: AutoSizeText(
                                              minFontSize: 6,
                                              maxFontSize: 11,
                                              'Unit: 100',
                                              style: TextStyle(
                                                  color: AppColor.appColorBlack,
                                                  fontWeight:
                                                      FontWeight.normal)))
                                    ],
                                  )),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ColoredBox(
                              color: AppColor.appColorOliveGreen,
                              child: SizedBox(
                                height: customHeight(context, percentage: 0.04),
                                width: customWidth(context, percentage: 0.13),
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        LimitedBox(
                                            maxHeight: 0.04,
                                            child: AutoSizeText(
                                                minFontSize: 10,
                                                maxFontSize: 12,
                                                '300',
                                                style: TextStyle(
                                                    color:
                                                        AppColor.appColorWhite,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                      ],
                                    )),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Transform.scale(
                              scale: 0.4,
                              child: ColoredBox(
                                color: model.userData == 'User'
                                    ? AppColor.appColorBlack
                                    : Colors.black.withOpacity(0.0),
                                child: SizedBox(
                                  height:
                                      customHeight(context, percentage: model.userData == 'User'?0.17:0.06),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (model.userData == 'User')
                                        IconButton(
                                            color: AppColor.appColorBlack,
                                            onPressed: () {
                                              print('object+');

                                              model.notifyListeners();
                                            },
                                            icon: const Icon(
                                              Icons.add,
                                              color: AppColor.appColorWhite,
                                              size: 35,
                                            )),
                                      Container(
                                        height: customHeight(context,
                                            percentage: 0.05),
                                        width: customWidth(context,
                                            percentage: 0.09),
                                        decoration: const BoxDecoration(
                                          color: AppColor.appColorWhite,
                                        ),
                                        child: Center(
                                            child: Text(
                                          model.userData == 'User' ? '3' : '3',
                                          style: TextStyle(fontSize: 32),
                                        )),
                                      ),
                                      if (model.userData == 'User')
                                        IconButton(
                                            color: AppColor.appColorBlack,
                                            onPressed: () {
                                              print('object-');

                                              model.notifyListeners();
                                            },
                                            icon: const Icon(
                                              Icons.remove,
                                              color: AppColor.appColorWhite,
                                              size: 35,
                                            )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

customCustomerInfo() {
  return Column(
    children: [
      Container(
        width: 363,
        height: 102,
        child: const SizedBox(
          width: 253,
          height: 68,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Customer name: ',
                  style: TextStyle(
                    color: AppColor.appColorBlack,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'Mohammed Naser\n',
                  style: TextStyle(
                    color: AppColor.appColorBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'contact No.',
                  style: TextStyle(
                    color: AppColor.appColorBlack,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: ': 36664444 | 34444666\n',
                  style: TextStyle(
                    color: AppColor.appColorBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'Address:',
                  style: TextStyle(
                    color: AppColor.appColorBlack,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: ' Salmabad, road 123, building 321',
                  style: TextStyle(
                    color: AppColor.appColorBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
