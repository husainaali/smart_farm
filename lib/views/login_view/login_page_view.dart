import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_farm/constants/constants_helper.dart';
import 'package:smart_farm/widgets/custom_widget_helper.dart';
import 'package:stacked/stacked.dart';

import '../../constants/strings.dart';
import '../../routes/routes.dart';
import 'login_page_view_model.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginPageViewModel>.reactive(
        viewModelBuilder: () => LoginPageViewModel(),
        onViewModelReady: (model) => model.initialize(),
        builder: (context, model, child) => Scaffold(
            backgroundColor: Colors.white,
            body: Stack(children: [
              Image.asset(
                'assets/background.png',
                height: customHeight(context),
                width: customWidth(context),
              ),
              SizedBox(
                height: customHeight(context,
                    percentage: model.isLoginPage ? 0.87 : 0.93),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: customWidth(context),
                        height: customHeight(context,
                            percentage: model.isLoginPage ? 0.85 : 0.91),
                        decoration: BoxDecoration(
                          color: AppColor.appColorWhite.withOpacity(0.5),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(customHeight(context)),
                            bottomRight: Radius.circular(customHeight(context)),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ListView(
                          padding: EdgeInsets.only(
                            top: customHeight(context,
                                percentage: model.isLoginPage ? 0.2 : 0.1),
                            left: customWidth(context, percentage: 0.1),
                            right: customWidth(context, percentage: 0.1),
                            bottom: customHeight(context, percentage: 0.2),
                          ),
                          children: [
                            model.isLoginPage
                                ? Image.asset('assets/smart_farm.png')
                                : Image.asset('assets/smart_farm_small.png'),
                            if (model.isLoginPage)
                              const Text(
                                'Welcome Back!',
                                style: TextStyle(fontSize: 24),
                              ),
                            Row(
                              children: [
                                Text(
                                  model.isLoginPage
                                      ? 'Don’t have an account?'
                                      : 'Already have an account?',
                                  style: TextStyle(fontSize: 16),
                                ),
                                TextButton(
                                    onPressed: () {
                                      model.isLoginPage = !model.isLoginPage;
                                      model.notifyListeners();
                                    },
                                    child: Text(
                                      model.isLoginPage
                                          ? 'Sign up here'
                                          : 'Sign in',
                                      style: const TextStyle(
                                          color: AppColor.appColorGreenBlue,
                                          decoration: TextDecoration.underline,
                                          decorationColor:
                                              AppColor.appColorGreenBlue),
                                    ))
                              ],
                            ),
                            customLoginLoginPageField(
                                controller: model.textControllerUserEmail,
                                keyboardType: TextInputType.text,
                                lableTextField: 'Email*',
                                hintText: 'Enter your email'),
                            customLoginLoginPageField(
                              controller: model.textControllerUserPassword,
                              lableTextField: 'Password*',
                              hintText: 'Enter your password',
                              keyboardType: TextInputType.visiblePassword,
                            ),
                            if (!model.isLoginPage)
                              Column(children: [
                                customLoginLoginPageField(
                                  controller: model.textControllerUserFullName,
                                  lableTextField: 'Full Name*',
                                  hintText: 'Enter your full name',
                                  keyboardType: TextInputType.name,
                                ),
                                customLoginLoginPageField(
                                  controller: model.textControllerUserCPR,
                                  lableTextField: 'Personal ID*',
                                  hintText: 'Enter your personal ID',
                                  keyboardType: TextInputType.number,
                                ),
                                customLoginLoginPageField(
                                  controller:
                                      model.textControllerUserOccupation,
                                  lableTextField: 'Occupation',
                                  hintText: 'Enter your occupation',
                                  keyboardType: TextInputType.text,
                                ),
                                customLoginLoginPageField(
                                  controller: model.textControllerUserAddress,
                                  lableTextField: 'Address',
                                  hintText: 'Enter your address',
                                  keyboardType: TextInputType.streetAddress,
                                ),
                                customLoginLoginPageField(
                                  controller:
                                      model.textControllerUserContactNo1,
                                  lableTextField: 'Contact No 1',
                                  hintText: 'Enter your contact 1',
                                  keyboardType: TextInputType.phone,
                                ),
                                customLoginLoginPageField(
                                  controller:
                                      model.textControllerUserContactNo2,
                                  lableTextField: 'Contact No 2',
                                  hintText: 'Enter your contact 2',
                                  keyboardType: TextInputType.phone,
                                ),
                              ]),
                          ]),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(
                                  AppColor.appColorBlack),
                              overlayColor: MaterialStateProperty.all(
                                  AppColor.appColorWhite.withOpacity(0.5)),
                              backgroundColor: MaterialStateProperty.all(
                                  AppColor.appColorOliveGreen),
                              elevation: MaterialStateProperty.all(50)),
                          onPressed: () async {
                            if (model.isLoginPage) {
                              await model.sharedPreferenceService.saveData(
                                  AppString.userData,
                                  model.textControllerUserEmail.value.text);
                              if (model.textControllerUserEmail.value.text ==
                                      'Manager' ||
                                  model.textControllerUserEmail.value.text ==
                                      'User') context.push(WrapperRoute.path);
                            }
                          },
                          child: Text(
                            model.isLoginPage ? "Sign In" : "Sign Up",
                            style: TextStyle(color: AppColor.appColorWhite),
                          )),
                    )
                  ],
                ),
              ),
            ])));
  }
}

TextField customLoginLoginPageField({
  controller,
  TextInputType keyboardType = TextInputType.emailAddress,
  dynamic lableTextField,
  String hintText = 'Enter your email',
}) {
  return TextField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: lableTextField == 'Password*' ? true : false,
    onChanged: (value) {
      // model.fillRegistrationForm(value, 'Password');
    },
    decoration: InputDecoration(
      labelText: lableTextField ?? '',
      labelStyle: TextStyle(color: AppColor.appColorBlack),
      hintText: hintText,
      hintStyle: TextStyle(color: AppColor.appColorGreyNormal),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.appColorGreyNormal),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.appColorBlack),
      ),
    ),
  );
}
