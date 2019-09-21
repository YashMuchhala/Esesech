import 'package:esesech/core/constants/enums.dart';
import 'package:esesech/core/constants/route_path.dart';
import 'package:esesech/core/viewmodels/home/users.dart';
import 'package:esesech/ui/views/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/models/server_user.dart';

class HomeUsersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeUsersViewModel>(
      builder: (BuildContext context, HomeUsersViewModel model, Widget child) {
        return _buildUI(context, model);
      },
      onViewModelInit: (HomeUsersViewModel model) => model.fetchServerUsers(),
    );
  }

  Widget _buildUI(BuildContext context, HomeUsersViewModel model) {
    return Container(
      child: model.state == ViewModelState.Busy
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: model.serverUserList.length,
              itemBuilder: (BuildContext context, int index) {
                ServerUser serverUser = model.serverUserList.elementAt(index);
                return ListTile(
                  title: Text(serverUser.username),
                  subtitle: Text(serverUser.status),
                  trailing: IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      Navigator.of(context).pushNamed(RoutePath.USER_SETTINGS);
                    },
                  ),
                );
              },
            ),
    );
  }
}
