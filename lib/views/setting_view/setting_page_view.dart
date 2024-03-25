import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

import '../../constants/constants_helper.dart';
import '../../constants/strings.dart';
import '../../routes/routes.dart';
import '../../widgets/custom_widget_helper.dart';
import 'setting_page_view_model.dart';

class SettingPageView extends StatelessWidget {
  const SettingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingPageViewModel>.reactive(
        viewModelBuilder: () => SettingPageViewModel(),
        onViewModelReady: (model) => model.initialize(),
        builder: (context, model, child) => Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
                child: ListView(children: [
              Gap(300),
              SizedBox(
                width: customWidth(context, percentage: 0.8),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shadowColor:
                              MaterialStateProperty.all(AppColor.appColorBlack),
                          overlayColor: MaterialStateProperty.all(
                              AppColor.appColorWhite.withOpacity(0.5)),
                          backgroundColor: MaterialStateProperty.all(
                              AppColor.appColorOliveGreen),
                          elevation: MaterialStateProperty.all(50)),
                      onPressed: () async {
                        await model.sharedPreferenceServiceSetting
                            .removeData(AppString.userData);
                            model.notifyListeners();
                        context.push(LoginPageViewRoute.path);
                        
                      },
                      child: Text(
                        "Log Out",
                        style: TextStyle(color: AppColor.appColorWhite),
                      )),
                ),
              ),
            ]))));
  }
}
