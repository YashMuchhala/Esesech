import 'package:esesech/core/constants/enums.dart';
import 'package:esesech/core/models/server_user.dart';
import 'package:esesech/core/services/ssh.dart';
import 'package:esesech/core/viewmodels/base.dart';

class HomeUsersSettingsViewModel extends BaseViewModel {
  ServerUser serverUser;
  Future<void> deleteServerUser() async {
    try {
      setState(ViewModelState.Busy);
      const String REMOVE_USER = 'userdel';
      String _ =
          await SshHelper.execute(REMOVE_USER + " " + serverUser.username);
      setState(ViewModelState.Idle);
    } catch (e) {
      print("Error: $e");
      setState(ViewModelState.Idle);
    }
  }

  Future<void> expireServerUserPassword() async {
    try {
      setState(ViewModelState.Busy);
      const String EXPIRE_USER_PASSWORD = 'passwd -e';
      String _ = await SshHelper.execute(
          EXPIRE_USER_PASSWORD + " " + serverUser.username);
      setState(ViewModelState.Idle);
    } catch (e) {
      print("Error: $e");
      setState(ViewModelState.Idle);
    }
  }

  Future<void> lockServerUser() async {
    try {
      setState(ViewModelState.Busy);
      const String LOCK_USER = 'passwd -l';
      String _ = await SshHelper.execute(LOCK_USER + " " + serverUser.username);
      setState(ViewModelState.Idle);
    } catch (e) {
      print("Error: $e");
      setState(ViewModelState.Idle);
    }
  }

  Future<void> unlockServerUser() async {
    try {
      setState(ViewModelState.Busy);
      const String UNLOCK_USER = 'passwd -u';
      String _ =
          await SshHelper.execute(UNLOCK_USER + " " + serverUser.username);
      setState(ViewModelState.Idle);
    } catch (e) {
      print("Error: $e");
      setState(ViewModelState.Idle);
    }
  }

  Future<void> changeServerUserName(String newName) async {
    try {
      setState(ViewModelState.Busy);
      const String CHANGE_USER_NAME = 'usermod -c';
      String _ = await SshHelper.execute(
          CHANGE_USER_NAME + " " + "'$newName'" + " " + serverUser.username);
      setState(ViewModelState.Idle);
    } catch (e) {
      print("Error: $e");
      setState(ViewModelState.Idle);
    }
  }
}
