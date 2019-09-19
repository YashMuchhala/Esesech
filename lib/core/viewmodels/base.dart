import 'package:flutter/widgets.dart';

import '../constants/enums.dart';

class BaseViewModel extends ChangeNotifier {
  ViewModelState _state = ViewModelState.Idle;

  ViewModelState get state => _state;

  void setState(ViewModelState viewModelState) {
    _state = viewModelState;
    notifyListeners();
  }
}