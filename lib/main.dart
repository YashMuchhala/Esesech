import 'package:esesech/core/services/ssh.dart';
import 'package:flutter/material.dart';

import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String result;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Esesech',
      home: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("CMD"),
                  onPressed: () async {
                    
                    SshService.executeCommand("ec2-13-234-30-69.ap-south-1.compute.amazonaws.com", "ls");
                  },
                ),
                Text(result),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
