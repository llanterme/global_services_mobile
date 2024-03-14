import 'package:get_it/get_it.dart';
import 'package:global_services_mobile/core/viewmodels/profile_view_model.dart';

import 'core/network/api.dart';
import 'core/viewmodels/login_view_model.dart';
import 'core/viewmodels/register_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => RegisterViewModel());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => LoginViewModel());
  locator.registerLazySingleton(() => ProfileViewModel());
}
