import 'package:esesech/core/models/server_user.dart';
import 'package:esesech/ui/views/user_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:esesech/core/constants/route_path.dart';
import 'package:esesech/ui/views/home.dart';
import 'package:esesech/ui/views/shell.dart';
import 'package:esesech/ui/views/add_server_user.dart';

class Router {
  static Route<MaterialPageRoute> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.HOME:
        return MaterialPageRoute(builder: (_) => HomeView());
      case RoutePath.SHELL:
        return CupertinoPageRoute(builder: (_) => ShellView());
      case RoutePath.ADD_SERVER_USER:
        return CupertinoPageRoute(builder: (_) => AddServerUserView());
      case RoutePath.SERVER_USER_SETTINGS:
        {
          ServerUser serverUser = settings.arguments;
          return MaterialPageRoute(
            builder: (_) => UserSettings(
              serverUser: serverUser,
            ),
          );
        }
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
