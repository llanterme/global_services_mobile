import 'package:get_it/get_it.dart';
import 'package:global_services_mobile/core/viewmodels/activity_history_view_model.dart';
import 'package:global_services_mobile/core/viewmodels/landing_view_model.dart';
import 'package:global_services_mobile/core/viewmodels/upload_image_view_model.dart';
import 'core/network/api.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => LandingViewModel());
  locator.registerLazySingleton(() => ActivityHistoryViewModel());
  locator.registerLazySingleton(() => UploadImageViewModel());
}
