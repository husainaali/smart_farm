import 'package:flutter/material.dart';
import 'package:smart_farm/views/home_view/home_page_view.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/custom_widget_helper.dart';
import '../cart_view/cart_page_view.dart';
import '../login_view/login_page_view.dart';
import 'wrapper_view_model.dart';

class WrapperView extends StatelessWidget {
  const WrapperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WrapperViewModel>.reactive(
        viewModelBuilder: () => WrapperViewModel(),
        onViewModelReady: (model) => model.initialize(context),
        builder: (context, model, child) => Scaffold(
            bottomNavigationBar: model.navSelectedItem == 5
                ? null
                : bottomNavigationBar(context, model),
            body: model.busy
                ? customLoading()
                : 
                //model.loggedIn?
                 model.selectedPage
                   // : CartPageView()
                   ));
  }
}
