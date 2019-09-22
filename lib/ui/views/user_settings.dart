import 'package:esesech/core/viewmodels/user_settings.dart';
import 'package:flutter/material.dart';

import 'base.dart';

class UserSettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<UserSettingsViewModel>(builder:
        (BuildContext context, UserSettingsViewModel model, Widget child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "User—" + model.serverUser.username,
            style: TextStyle(fontFamily: "Ubuntu Mono", color: Colors.black54),
          ),
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black87,
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: _buildUI(context, model),
      );
    }, onViewModelInit: (UserSettingsViewModel model) {
      return model.getServerUserInfo();
    });
  }

  Widget _buildUI(context, model) {
    return Container(
      padding: EdgeInsets.all(50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Name: ${model.serverUser.name}",
            style: TextStyle(fontSize: 24),
          ),
          Text(
            "Username: ${model.serverUser.username}",
            style: TextStyle(fontSize: 24),
          ),
          Text(
            "User ID: ${model.serverUser.uid}",
            style: TextStyle(fontSize: 24),
          ),
          Text(
            "Group ID: ${model.serverUser.gid}",
            style: TextStyle(fontSize: 24),
          ),
          Text(
            "Home Directory: ${model.serverUser.homeDirectory}",
            style: TextStyle(fontSize: 24),
          ),
          Text(
            "Status: ${model.serverUser?.status}" ?? "",
            style: TextStyle(fontSize: 24),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(10.0),
              childAspectRatio: 2.0,
              children: <Widget>[
                RaisedButton(
                  child: Text("Lock/Disable User"),
                  onPressed: () => model.lockServerUser(),
                  color: Colors.yellow,
                ),
                RaisedButton(
                  child: Text("Unlock/Enable User"),
                  onPressed: () => model.unlockServerUser(),
                ),
                RaisedButton(
                  child: Text("Delete User"),
                  onPressed: () => model.deleteServerUser(),
                ),
                RaisedButton(
                  child: Text("Request Password Change"),
                  onPressed: () => model.expireServerUserPassword(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
