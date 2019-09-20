import '../viewmodels/base.dart';

class HomeViewModel extends BaseViewModel {
  int _tabIndex;

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
