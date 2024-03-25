import 'package:get_it/get_it.dart';

import '../views/wrapper_view/wrapper_view.dart';
import '../views/wrapper_view/wrapper_view_model.dart';
import 'api_service.dart';
import 'shared_preferences_service.dart';
import 'user_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Register services
  // locator.registerLazySingleton<NameService>(() => NameService());
  locator.registerLazySingleton<ApiService>(() => ApiService());
  locator.registerLazySingleton<UserService>(() => UserService());
  locator.registerLazySingleton<WrapperView>(() => const WrapperView());
  locator.registerLazySingleton<SharedPreferenceService>(() => SharedPreferenceService());


  // Register models
  // locator.registerSingleton<NameViewModel>(NameViewModel());
}
