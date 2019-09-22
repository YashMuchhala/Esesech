import 'package:esesech/ui/router.dart';
import 'package:flutter/material.dart';

import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(brightness: Brightness.light, accentColor: Colors.yellow, fontFamily: "Product Sans"),
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
    );
  }
}
