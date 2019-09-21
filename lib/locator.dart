import 'package:get_it/get_it.dart';

import 'core/viewmodels/home.dart';
import 'core/viewmodels/home/shell.dart';

GetIt locator = GetIt.instance;

void setupLocator() {

  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => ShellViewModel());
}