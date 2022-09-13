import 'package:flutter_base/services/remote/api.dart';
import 'package:flutter_base/utils/navigator.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => SharedPrefs());
  locator.registerLazySingleton(() => API());
  locator.registerLazySingleton(() => NavigationService());
}

class SharedPrefs {
}
