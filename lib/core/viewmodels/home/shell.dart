import 'package:esesech/core/services/ssh.dart';
import 'package:flutter/material.dart';

import '../base.dart';

class ShellViewModel extends BaseViewModel {
  int commandNumber = 0;
  List<String> shellCommands = [];
  List<String> shellResults = [];

  ShellViewModel() {
    shellCommands.add("First command");
    shellResults.add("First result");
    commandNumber++;
  }
  Future<void> sendCommand(TextEditingValue value) async {
    String command = value.text;

    shellCommands.add(command);
    commandNumber++;
    try {
      String result = await SshHelper.execute(command);
      shellResults.add(result);
      notifyListeners();
    } catch (e) {
      shellResults.add("No output");
      notifyListeners();
    }
  }
}
