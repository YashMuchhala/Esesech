import 'package:esesech/core/models/server_user.dart';
import 'package:esesech/core/services/ssh.dart';
import 'package:esesech/core/viewmodels/base.dart';

class UserSettingsViewModel extends BaseViewModel {
  ServerUser serverUser;

  Future<String> getServerUserInfo() async {
    try {
      const String USER_STATUS = 'sudo passwd -S';
      String result =
          await SshHelper.execute(USER_STATUS + " " + serverUser.username);
      String _userStatus = result.split(" ").elementAt(1);
      print(result);
      print(_userStatus);
      return _userStatus;
    } catch (e) {
      print("Error: $e");
      return "";
    }
  }

  Future<void> deleteServerUser() async {
    try {
      const String REMOVE_USER = 'sudo userdel';
      String _ = await SshHelper.execute(
          REMOVE_USER + " " + serverUser.username);
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> expireServerUserPassword() async {
    try {
      const String EXPIRE_USER_PASSWORD = 'sudo passwd -e';
      String _ = await SshHelper.execute(
          EXPIRE_USER_PASSWORD + " " + serverUser.username);
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> lockServerUser() async {
    try {
      const String LOCK_USER = 'sudo passwd -l';
      String _ =
          await SshHelper.execute(LOCK_USER + " " + serverUser.username);
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> unlockServerUser() async {
    try {
      const String UNLOCK_USER = 'sudo passwd -u';
      String _ =
          await SshHelper.execute(UNLOCK_USER + " " + serverUser.username);
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> changeServerUserName(String newName) async {
    try {
      const String CHANGE_USER_NAME = 'sudo usermod -c';
      String _ = await SshHelper.execute(CHANGE_USER_NAME +
          " " +
          "'$newName'" +
          " " +
          serverUser.username);
    } catch (e) {
      print("Error: $e");
    }
  }
}
