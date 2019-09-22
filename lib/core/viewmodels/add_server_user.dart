import 'package:esesech/core/constants/enums.dart';
import 'package:esesech/core/services/ssh.dart';
import 'package:flutter/foundation.dart';

import 'base.dart';

class AddServerUserViewModel extends BaseViewModel {
  Future<void> addServerUser({
    @required String username,
    @required String password,
    String name,
  }) async {
    try {
      setState(ViewModelState.Busy);
      const String ADD_USER = 'sudo useradd ';
      String command = ADD_USER;
      command += "-p $password ";
      if (name != null) {
        command += "-c $name ";
      }

      command += username;

      String _ = await SshHelper.execute(command);
      setState(ViewModelState.Idle);
    } catch (e) {
      // print("Error: $e");
      setState(ViewModelState.Idle);
    }
  }
}
