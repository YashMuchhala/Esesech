import 'package:get_it/get_it.dart';

import 'core/viewmodels/home.dart';
import 'core/viewmodels/home/dashboard.dart';
import 'core/viewmodels/home/users.dart';
import 'core/viewmodels/home/shell.dart';
import 'core/viewmodels/home/users/settings.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => HomeDashboardViewModel());
  locator.registerFactory(() => HomeUsersViewModel());
  locator.registerFactory(() => HomeShellViewModel());
  locator.registerFactory(() => HomeUsersSettingsViewModel());
}
