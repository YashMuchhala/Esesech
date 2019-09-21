import 'package:flutter/material.dart';

import '../base.dart';
import '../../../core/viewmodels/home/shell.dart';

class ShellView extends StatefulWidget {
  @override
  _ShellViewState createState() => _ShellViewState();
}

class _ShellViewState extends State<ShellView> {
  final TextEditingController _commandTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseView<ShellViewModel>(
      builder: (BuildContext context, ShellViewModel model, Widget child) {
        return _buildUI(context, model);
      },
    );
  }

  Widget _buildUI(BuildContext context, ShellViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.black,
            child: ListView.builder(
              reverse: true,
              itemBuilder: (BuildContext context, int index) {
                // Get elements from last
                index = (model.commandNumber - 1) - index;
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
              RaisedButton(
                  child: Text("Run cmd"),
                  onPressed: () async {
                    await model.sendCommand(_commandTextController.value);
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
