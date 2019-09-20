import 'package:flutter/material.dart';

import '../base.dart';
import '../../../core/viewmodels/home/shell.dart';

class ShellView extends StatefulWidget {
  @override
  _ShellViewState createState() => _ShellViewState();
}

class _ShellViewState extends State<ShellView> {
  final TextEditingController _commandController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseView<ShellViewModel>(
      builder: (BuildContext context, ShellViewModel model, Widget child) {
        return _buildUI(context, model);
      },
    );
  }

  Widget _buildUI(BuildContext context, ShellViewModel model) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Row(
            children: <Widget>[
              Container(
                child: TextField(
                  autocorrect: false,
                  controller: _commandController,
                  keyboardType: TextInputType.text,
                ),
              ),
              RaisedButton(
                child: Text("Run"),
                onPressed: () => model.sendCommand(_commandController.value),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
