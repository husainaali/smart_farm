part of 'custom_widget_helper.dart';

Widget bottomNavigationBar(context, WrapperViewModel model) {
  return Padding(
    padding: EdgeInsets.all(customWidth(context, percentage: 0.06)),
    child: Container(
      height: customHeight(context, percentage: 0.085),
      width: customHeight(context, percentage: 0.8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColor.appColorOliveGreen),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: List.generate(
            3,
            (index) => Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Stack(alignment: Alignment.center, children: [
                if (index == 0 && model.cartItemNo > 0)
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: customHeight(context, percentage: 0.03),
                      width: customHeight(context, percentage: 0.03),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.appColorRed),
                      child: Center(
                          child: Text(
                        '${model.cartItemNo}',
                        style: TextStyle(
                            color: AppColor.appColorWhite,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                IconButton(
                  iconSize: customHeight(context, percentage: 0.05),
                  onPressed: () {
                    model.selectedPage = index == 0
                        ? CartPageView()
                        : index == 1
                            ? model.userData == 'User'
                                ? HomePageView()
                                : HomeManagerPageView()
                            : SettingPageView();
                    model.navSelectedItem = index;
                    model.notifyListeners();
                  },
                  icon: index == 0? model.userData=='User'? Icon(
                       Icons.shopping_cart)
                      :SvgPicture.asset('assets/managerstock.svg'): index == 1
                          ? Icon(
                       Icons.home):Icon(
                       Icons.person),
                          
                          
                  color: model.navSelectedItem == index
                      ? AppColor.appColorWhite
                      : AppColor.appColorGreyDark,
                ),
              ]),
            ),
          )),
    ),
  );
}

// bottomNavigationBar(context, WrapperViewModel model) {
//   final WrapperViewModel wrapperViewModel = locator.get<WrapperViewModel>();
//   return BottomNavigationBar(
//       iconSize: customHeight(context, percentage: 0.043),
//       currentIndex: model.selectedItem,
//       showSelectedLabels: false,
//       onTap: (value) async {
//         model.onNavigationBarTapped(value);
//         if (value == 0) {
//           model.selectedPage = model.userData!.role == 'User'
//               ? HomePageView()
//               : model.userData!.role == 'Manager'
//                   ? HomeManagerPageView()
//                   : null;
//           model.selectedItem = 0;
//           model.notifyListeners();
//         } else if (value == 1) {
//           // model.selectedPage = model.userData!.role == 'User'
//           //     ? MapPageView()
//           //     : model.userData!.role == 'Manager'
//           //         ? EmployeesPageView()
//           //         : ManagerPageView();
//           model.selectedItem = 1;
//           model.notifyListeners();
//         } else if (value == 2) {
//           // model.selectedPage = model.userData!.role == 'User'
//           //     ? CalculatorPageView()
//           //     : MapPageView();
//           model.selectedItem = 2;
//           model.notifyListeners();
//         } else if (value == 3) {
//           // model.selectedPage = SettingPageView();
//           model.selectedItem = 3;
//           model.notifyListeners();
//         }
//       },
//       items: [
//         BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//               color: model.selectedItem == 0
//                   ? AppColor.appColorOliveGreen
//                   : AppColor.appColorGreylight,
//             ),
//             backgroundColor: AppColor.appColorGreenBlue,
//             label: ''),
//         BottomNavigationBarItem(
//             icon: model.userData?.role == 'User'
//                 ? Icon(
//                     Icons.pin_drop,
//                     color: model.selectedItem == 1
//                         ? AppColor.appColorOliveGreen
//                         : AppColor.appColorGreylight,
//                   )
//                 : model.userData?.role == 'Manager'
//                     ? SvgPicture.asset(
//                         'assets/employees_icon.svg',
//                         color: model.selectedItem == 1
//                             ? AppColor.appColorOliveGreen
//                             : AppColor.appColorGreylight,
//                       )
//                     : SvgPicture.asset(
//                         'assets/manager_icon.svg',
//                         color: model.selectedItem == 1
//                             ? AppColor.appColorOliveGreen
//                             : AppColor.appColorGreylight,
//                       ),
//             backgroundColor: AppColor.appColorGreenBlue,
//             label: ''),
//         BottomNavigationBarItem(
//             icon: model.userData?.role == 'User'
//                 ? Icon(
//                     Icons.calculate,
//                     color: model.selectedItem == 2
//                         ? AppColor.appColorOliveGreen
//                         : AppColor.appColorGreylight,
//                   )
//                 : SvgPicture.asset(
//                     'assets/map.svg',
//                     color: model.selectedItem == 2
//                         ? AppColor.appColorOliveGreen
//                         : AppColor.appColorGreylight,
//                   ),
//             backgroundColor: AppColor.appColorGreenBlue,
//             label: ''),
//         BottomNavigationBarItem(
//             icon: Icon(
//               Icons.person,
//               color: model.selectedItem == 3
//                   ? AppColor.appColorOliveGreen
//                   : AppColor.appColorGreylight,
//             ),
//             backgroundColor: AppColor.appColorGreenBlue,
//             label: ''),
//       ]);
// }
