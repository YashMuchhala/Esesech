import 'package:esesech/core/viewmodels/home/users/settings.dart';
import 'package:esesech/ui/views/base.dart';
import 'package:flutter/material.dart';

class HomeUsersSettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeUsersSettingsViewModel>(
      builder: (BuildContext context, HomeUsersSettingsViewModel model,
          Widget child) {
        return Scaffold(
          body: _buildUI(context, model),
        );
      },
    );
  }

  Widget _buildUI(BuildContext context, HomeUsersSettingsViewModel model) {
    return Container();
  }
}
