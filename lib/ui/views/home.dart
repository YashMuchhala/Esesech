import 'package:flutter/material.dart';

import 'package:esesech/core/viewmodels/home.dart';
import 'package:esesech/ui/views/base.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      builder: (BuildContext context, HomeViewModel model, Widget child) {
        return Scaffold(
          body: model.tabScreens.elementAt(model.tabIndex),
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
