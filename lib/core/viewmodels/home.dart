import 'package:flutter/material.dart';

import '../viewmodels/base.dart';

class HomeViewModel extends BaseViewModel {
  int _tabIndex;

  List<Widget> tabScreens = <Widget>[
    Center(
      child: Text("Dashboard"),
    ),
    Center(
      child: Text("Users"),
    ),
    Center(
      child: Text("Shell"),
    ),
  ];
  HomeViewModel() {
    _tabIndex = 0;
  }

  int get tabIndex {
    return this._tabIndex;
  }

  void onBarItemTapped(int index) {
    _tabIndex = index;
    notifyListeners();
  }
}
