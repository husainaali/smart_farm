// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $wrapperRoute,
      $loginPageViewRoute,
    ];

RouteBase get $wrapperRoute => GoRouteData.$route(
      path: '/',
      factory: $WrapperRouteExtension._fromState,
    );

extension $WrapperRouteExtension on WrapperRoute {
  static WrapperRoute _fromState(GoRouterState state) => const WrapperRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginPageViewRoute => GoRouteData.$route(
      path: '/',
      factory: $LoginPageViewRouteExtension._fromState,
    );

extension $LoginPageViewRouteExtension on LoginPageViewRoute {
  static LoginPageViewRoute _fromState(GoRouterState state) =>
      const LoginPageViewRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
