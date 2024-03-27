import 'package:get_it/get_it.dart';
import 'package:global_services_mobile/core/service/strava_service.dart';
import 'package:global_services_mobile/core/viewmodels/register_view_model.dart';
import 'package:global_services_mobile/core/viewmodels/strava_detail_view_model.dart';
import 'package:global_services_mobile/core/viewmodels/strava_view_model.dart';

import 'core/network/api.dart';
import 'core/viewmodels/login_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => LoginViewModel());
  locator.registerLazySingleton(() => RegisterViewModel());
  locator.registerLazySingleton(() => StravaViewModel());
  locator.registerLazySingleton(() => StravaService());
  locator.registerLazySingleton(() => StravaDetailViewModel());
}
