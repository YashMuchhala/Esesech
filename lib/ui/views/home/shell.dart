import 'package:esesech/core/constants/enums.dart';
import 'package:flutter/material.dart';

import '../base.dart';
import '../../../core/viewmodels/home/shell.dart';

class HomeShellView extends StatefulWidget {
  @override
  _HomeShellViewState createState() => _HomeShellViewState();
}

class _HomeShellViewState extends State<HomeShellView> {
  final TextEditingController _commandTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeShellViewModel>(
      builder: (BuildContext context, HomeShellViewModel model, Widget child) {
        return _buildUI(context, model);
      },
    );
  }

  Widget _buildUI(BuildContext context, HomeShellViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.black,
            child: ListView.builder(
              shrinkWrap: true,
              reverse: false,
              itemBuilder: (BuildContext context, int index) {
                // // Get elements from last
                return Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "serverssh:~ ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              model.shellCommands.elementAt(index),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 10.0),
                        child: Text(
                          model.shellResults.elementAt(index),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: model.shellResults.length,
            ),
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  decoration:
                      const InputDecoration(hintText: "Enter a command"),
                  controller: _commandTextController,
                ),
              ),
              Container(
                child: model.state == ViewModelState.Busy
                    ? CircularProgressIndicator()
                    : RaisedButton(
                        child: Text("Run cmd"),
                        onPressed: () async {
                          await model.sendCommand(_commandTextController.value);
                        }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
