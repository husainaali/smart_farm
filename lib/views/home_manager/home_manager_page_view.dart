import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';

import '../../constants/constants_helper.dart';
import '../../models/categories_and_items.dart';
import '../../widgets/custom_widget_helper.dart';
import 'home_manager_page_view_model.dart';

class HomeManagerPageView extends StatelessWidget {
  const HomeManagerPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeManagerPageViewModel>.reactive(
        viewModelBuilder: () => HomeManagerPageViewModel(),
        onViewModelReady: (model) => model.initialize(),
        builder: (context, model, child) => Scaffold(
              appBar: customShortAppBar(context,
                  parentPage: 'customer_home',
                  resources: customCustomerHome(context, model)),
              backgroundColor: Colors.white,
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
              )),
              floatingActionButton: FloatingActionButton(
                backgroundColor: AppColor.appColorOliveGreen,
                onPressed: () {},
                child: Icon(Icons.add),
              ),
            ));
  }
}

customCustomerHome(context, HomeManagerPageViewModel model) {
  return Stack(children: [
    SizedBox(
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
    ),
    IconButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(AppColor.appColorOliveGreen),
            elevation: MaterialStateProperty.all(10)),
        onPressed: () {},
        icon: Icon(Icons.add)),
  ]);
}

customItemWidget(
    context, HomeManagerPageViewModel model, index, List<ItemsList> itemsList) {
  return Stack(children: [
    Padding(
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
                model.categoriesList[model.catSelected].itemsList[index]
                    .imagePath!,
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
                  child: SizedBox(
                    height: customHeight(context, percentage: 0.04),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Available:'),
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
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: customHeight(context, percentage: 0.04),
                  width: customWidth(context, percentage: 0.25),
                  child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Gap(5),
                          LimitedBox(
                              maxHeight: 0.04,
                              child: AutoSizeText(
                                  minFontSize: 12,
                                  maxFontSize: 14,
                                  '${model.categoriesList[model.catSelected].itemsList[index].price} BHD',
                                  style: TextStyle(
                                      color: AppColor.appColorBlack,
                                      fontWeight: FontWeight.bold)))
                        ],
                      )),
                )
              ],
            )
          ],
        ),
      ),
    ),
    IconButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(AppColor.appColorOliveGreen),
            elevation: MaterialStateProperty.all(10)),
        onPressed: () {},
        icon: Icon(Icons.edit)),
  ]);
}
