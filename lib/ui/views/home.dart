import 'package:flutter/material.dart';

import 'base.dart';
import 'home/dashboard.dart';
import 'home/shell.dart';
import 'home/users.dart';
import '../../core/viewmodels/home.dart';

class HomeView extends StatelessWidget {
  final List<Widget> tabScreens = <Widget>[
    Center(
      child: DashboardView(),
    ),
    Center(
      child: UsersView(),
    ),
    Center(
      child: ShellView(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      builder: (BuildContext context, HomeViewModel model, Widget child) {
        return Scaffold(
          body: tabScreens.elementAt(model.tabIndex),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: model.tabIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.data_usage),
                title: Text("Dashboard"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_outline),
                title: Text("Users"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.code),
                title: Text("Shell"),
              ),
            ],
            onTap: model.onBarItemTapped,
          ),
        );
      },
    );
  }
}
