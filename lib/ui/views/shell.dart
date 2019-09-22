import 'package:esesech/core/constants/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base.dart';
import '../../core/viewmodels/shell.dart';

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
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: GestureDetector(
              child: Icon(
                Icons.close,
                color: Colors.black54,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text("Shell",
                style: TextStyle(
                  color: Colors.black54,
                  fontFamily: "Ubuntu Mono",
                  fontSize: 24.0,
                )),
          ),
          body: _buildUI(context, model),
        );
      },
    );
  }

  Widget _buildUI(BuildContext context, ShellViewModel model) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.black12,
            child: ListView.builder(
              shrinkWrap: true,
              reverse: false,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "server:~ ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Ubuntu Mono",
                                fontSize: 20.0,
                              ),
                            ),
                            Text(
                              model.shellCommands.elementAt(index),
                              style: TextStyle(
                                fontFamily: "Ubuntu Mono",
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 0.0),
                        child: Text(
                          model.shellResults.elementAt(index),
                          style: TextStyle(
                            fontFamily: "Ubuntu Mono",
                            fontSize: 20.0,
                          ),
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
                child: Container(
                  child: TextField(
                    decoration:
                        const InputDecoration(hintText: "Enter a command"),
                    controller: _commandTextController,
                    autofocus: true,
                    autocorrect: false,
                  ),
                  padding: EdgeInsets.only(left: 10.0),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: model.state == ViewModelState.Busy
                    ? CircularProgressIndicator()
                    : ButtonTheme(
                        minWidth: 100.0,
                        child: RaisedButton(
                            color: Colors.yellow,
                            child: Text("RUN",
                                style: TextStyle(
                                  fontFamily: "Ubuntu Mono",
                                  fontSize: 16.0,
                                )),
                            onPressed: () async {
                              await model
                                  .sendCommand(_commandTextController.value);
                                  _commandTextController.clear();
                            }),
                      ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
