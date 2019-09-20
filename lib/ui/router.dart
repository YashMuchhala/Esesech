import 'package:flutter/material.dart';

import 'package:esesech/core/constants/route_path.dart';
import 'package:esesech/ui/views/home.dart';

class Router {
  static Route<MaterialPageRoute> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.HOME:
        return MaterialPageRoute(builder: (_) => HomeView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}