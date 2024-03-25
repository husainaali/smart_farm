import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/login_view/login_page_view.dart';
import '../views/wrapper_view/wrapper_view.dart';



part 'routes.g.dart';

GoRouter router() {
  return GoRouter(
    // navigatorKey: ,

    // refreshListenable: notifier,
    debugLogDiagnostics: true,
    initialLocation: WrapperRoute.path,
    routes: $appRoutes,
    //redirect: notifier.redirect,
  );
}

@TypedGoRoute<WrapperRoute>(path: WrapperRoute.path)
class WrapperRoute extends GoRouteData {
  const WrapperRoute();

  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const WrapperView();
  }
}

@TypedGoRoute<LoginPageViewRoute>(path: LoginPageViewRoute.path)
class LoginPageViewRoute extends GoRouteData {
  const LoginPageViewRoute();

  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPageView();
  }
}