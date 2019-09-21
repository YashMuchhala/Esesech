import 'package:esesech/ui/views/home/users/settings.dart';
import 'package:flutter/material.dart';

import 'package:esesech/core/constants/route_path.dart';
import 'package:esesech/ui/views/home.dart';

class Router {
  static Route<MaterialPageRoute> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.HOME:
        return MaterialPageRoute(builder: (_) => HomeView());
      case RoutePath.USER_SETTINGS:
        return MaterialPageRoute(builder: (_) => HomeUsersSettingsView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}