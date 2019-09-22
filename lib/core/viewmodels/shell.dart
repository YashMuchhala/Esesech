import 'package:flutter/material.dart';

import 'base.dart';
import '../constants/enums.dart';
import '../services/ssh.dart';

class ShellViewModel extends BaseViewModel {
  List<String> shellCommands = [];
  List<String> shellResults = [];

  ShellViewModel() {
    shellCommands.add("");
    shellResults.add("");
  }
  Future<void> sendCommand(TextEditingValue value) async {
    setState(ViewModelState.Busy);
    String command = value.text;

    shellCommands.add(command);

    try {
      String result = await SshHelper.execute(command);
      shellResults.add(result);
      setState(ViewModelState.Idle);
    } catch (e) {
      // shellResults.add("APP ERROR: $e");
      setState(ViewModelState.Idle);
    }
  }
}
