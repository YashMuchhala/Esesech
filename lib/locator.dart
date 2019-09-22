import 'package:esesech/core/viewmodels/add_server_user.dart';
import 'package:get_it/get_it.dart';

import 'core/viewmodels/home.dart';
import 'core/viewmodels/shell.dart';
import 'core/viewmodels/user_settings.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => ShellViewModel());
  locator.registerFactory(() => UserSettingsViewModel());
  locator.registerFactory(() => AddServerUserViewModel());
}
