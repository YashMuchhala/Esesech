import 'package:esesech/core/services/ssh.dart';
import 'package:flutter/material.dart';

import '../base.dart';

class ShellViewModel extends BaseViewModel {
  List<Map<String, Future<String>>> shellResults;
  void sendCommand(TextEditingValue value) async {
    String command = value.text + "\n";

    try {
      shellResults.add({command: SshHelper.writeToShell(command)});
      notifyListeners();
    } catch (e) {
      shellResults
          .add({command: Future.delayed(const Duration(seconds: 0), () => "")});
          notifyListeners();
    }
  }
}
