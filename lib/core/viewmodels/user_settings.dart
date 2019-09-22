import 'package:esesech/core/constants/enums.dart';
import 'package:esesech/core/models/server_user.dart';
import 'package:esesech/core/services/ssh.dart';
import 'package:esesech/core/viewmodels/base.dart';

class UserSettingsViewModel extends BaseViewModel {
  ServerUser serverUser;
  
  Future<String> getServerUserInfo() async {
    setState(ViewModelState.Busy);
    try {
      const String USER_STATUS = 'sudo passwd -S';
      String result =
          await SSHService.execute(USER_STATUS + " " + serverUser.username);
      String _userStatus = result.split(" ").elementAt(1);
      print(result);
      print(_userStatus);
      setState(ViewModelState.Idle);
      return _userStatus;
    } catch (e) {
      print("Error: $e");
      setState(ViewModelState.Idle);
      return "";
    }
  }

  Future<void> deleteServerUser() async {
    if (serverUser.username == "ubuntu") {
      print("Weird okay, but flex."); // DO SOMETHING NICE
      return;
    }

    setState(ViewModelState.Busy);
    try {
      const String REMOVE_USER = 'sudo userdel';
      String _ =
          await SSHService.execute(REMOVE_USER + " " + serverUser.username);
      setState(ViewModelState.Idle);
    } catch (e) {
      print("Error: $e");
      setState(ViewModelState.Idle);
    }
  }

  Future<void> expireServerUserPassword() async {
    if (serverUser.username == "ubuntu") {
      print("Weird okay, but flex."); // DO SOMETHING NICE
      return;
    }

    setState(ViewModelState.Busy);
    try {
      const String EXPIRE_USER_PASSWORD = 'sudo passwd -e';
      String _ = await SSHService.execute(
          EXPIRE_USER_PASSWORD + " " + serverUser.username);
      setState(ViewModelState.Idle);
    } catch (e) {
      print("Error: $e");
      setState(ViewModelState.Idle);
    }
  }

  Future<void> lockServerUser() async {
    if (serverUser.username == "ubuntu") {
      print("Weird okay, but flex."); // DO SOMETHING NICE
      return;
    }

    setState(ViewModelState.Busy);
    try {
      const String LOCK_USER = 'sudo passwd -l';
      String _ =
          await SSHService.execute(LOCK_USER + " " + serverUser.username);

      setState(ViewModelState.Idle);
    } catch (e) {
      print("Error: $e");
      setState(ViewModelState.Idle);
    }
  }

  Future<void> unlockServerUser() async {
    if (serverUser.username == "ubuntu") {
      print("Weird okay, but flex."); // DO SOMETHING NICE
      return;
    }

    setState(ViewModelState.Busy);
    try {
      const String UNLOCK_USER = 'sudo passwd -u';
      String _ =
          await SSHService.execute(UNLOCK_USER + " " + serverUser.username);
      setState(ViewModelState.Idle);
    } catch (e) {
      print("Error: $e");
      setState(ViewModelState.Idle);
    }
  }

  Future<void> changeServerUserName(String newName) async {
    setState(ViewModelState.Busy);
    try {
      const String CHANGE_USER_NAME = 'sudo usermod -c';
      String _ = await SSHService.execute(
          CHANGE_USER_NAME + " " + "'$newName'" + " " + serverUser.username);

      setState(ViewModelState.Idle);
    } catch (e) {
      print("Error: $e");
      setState(ViewModelState.Idle);
    }
  }
}
