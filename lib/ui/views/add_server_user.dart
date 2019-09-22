import 'package:esesech/core/constants/enums.dart';
import 'package:esesech/core/viewmodels/add_server_user.dart';
import 'package:esesech/ui/views/base.dart';
import 'package:flutter/material.dart';

class AddServerUserView extends StatefulWidget {
  AddServerUserView({Key key}) : super(key: key);

  _AddServerUserViewState createState() => _AddServerUserViewState();
}

class _AddServerUserViewState extends State<AddServerUserView> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseView<AddServerUserViewModel>(
      builder:
          (BuildContext context, AddServerUserViewModel model, Widget child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              "ADD NEW USER",
              style: TextStyle(color: Colors.black54),
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
      },
    );
  }

  Widget _buildUI(BuildContext context, AddServerUserViewModel model) {
    return Container(
        padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 28.0),
              child: Text("Name"),
              alignment: Alignment.bottomLeft,
            ),
            Container(
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Enter the new user's name",
                  hintStyle: TextStyle(fontSize: 10.0),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 28.0),
              child: Text("Username"),
              alignment: Alignment.bottomLeft,
            ),
            Container(
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: "Enter a unique username",
                  hintStyle: TextStyle(fontSize: 10.0),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 28.0),
              child: Text(
                "Password",
              ),
              alignment: Alignment.bottomLeft,
            ),
            Container(
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: "Enter a temporary password",
                  hintStyle: TextStyle(fontSize: 10.0),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child: model.state == ViewModelState.Busy
                  ? CircularProgressIndicator()
                  : ButtonTheme(
                      minWidth: 1000.0,
                      height: 50.0,
                      child: RaisedButton(
                        elevation: 0.0,
                        color: Colors.yellow,
                        child: Text("Send"),
                        onPressed: () async {
                          await model.addServerUser(
                            username: _usernameController.value.text,
                            password: _passwordController.value.text,
                            name: _nameController.value.text,
                          );
                          Navigator.pop(context);
                        },
                      ),
                    ),
            ),
          ],
        ));
  }
}
