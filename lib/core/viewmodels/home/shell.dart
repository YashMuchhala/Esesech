import 'package:flutter/material.dart';

import '../base.dart';
import '../../constants/enums.dart';
import '../../services/ssh.dart';

class HomeShellViewModel extends BaseViewModel {
  int commandNumber = 0;
  List<String> shellCommands = [];
  List<String> shellResults = [];

  HomeShellViewModel() {
    shellCommands.add("First command");
    shellResults.add("First result");
    commandNumber++;
  }
  Future<void> sendCommand(TextEditingValue value) async {
    setState(ViewModelState.Busy);
    String command = value.text;

    shellCommands.add(command);
    commandNumber++;
    try {
      String result = await SshHelper.execute(command);
      shellResults.add(result);
      setState(ViewModelState.Idle);
    } catch (e) {
      shellResults.add("APP ERROR: $e");
      setState(ViewModelState.Idle);
    
    }
  }
}
