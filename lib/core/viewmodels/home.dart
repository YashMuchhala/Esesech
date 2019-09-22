import 'package:esesech/core/constants/enums.dart';
import 'package:esesech/core/models/server_user.dart';
import 'package:esesech/core/services/ssh.dart';


import 'base.dart';

class HomeViewModel extends BaseViewModel {
  final List<ServerUser> serverUserList = [];
  // final List<ServerGroup> serverGroupList = [];

  Future<void> fetchServerUsers() async {
    const String SERVER_USERS_COMMAND = "getent passwd {1000..60000}";
    setState(ViewModelState.Busy);
    try {
      String result = await SSHService.execute(SERVER_USERS_COMMAND);
      _parseShellAndGetStatus(result);
      setState(ViewModelState.Idle);
    } catch (e) {
      setState(ViewModelState.Idle);
    }
  }

  void _parseShellAndGetStatus(String result) {
    List<String> delimitedByColon = result.split(":");
    List<String> newHopefulString = [];
    String temp1 = "";
    String temp2 = "";
    for (int i = 0; i < (delimitedByColon.length); i++) {
      if (i % 6 == 0 && i != 0) {
        int j = 0;
        List<String> temp = delimitedByColon[i].split("");
        while (j < 15) {
          if (temp[j] == 'h') {
            temp1 = temp.sublist(0, j + 1).join().trim();
            temp2 = temp.sublist(j + 3).join().trim();
            break;
          }
          j++;
        }
        newHopefulString.add(temp1);
        if (i < delimitedByColon.length - 1) {
          newHopefulString.add(temp2);
        }
      } else {
        newHopefulString.add(delimitedByColon[i]);
      }
    }

    for (int i = 0; i < newHopefulString.length; i += 7) {
      serverUserList.add(
          ServerUser.fromShell(newHopefulString.sublist(i, i + 7).join(":")));
    }
  }

}
