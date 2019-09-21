import 'package:flutter/foundation.dart';

class ServerUser {
  String username;
  String password;
  String uid;
  String gid;
  String name;
  String homeDirectory;
  String loginShell;
  String status;
  ServerUser({
    @required this.username,
    @required this.password,
    @required this.uid,
    @required this.gid,
    @required this.name,
    @required this.homeDirectory,
    @required this.loginShell,
  });

  factory ServerUser.fromShell(String userInfo) {
    List<String> _userInfo = userInfo.split(":");

    return ServerUser(
      username: _userInfo.elementAt(0) ?? "",
      password: _userInfo.elementAt(1) ?? "",
      uid: _userInfo.elementAt(2) ?? "",
      gid: _userInfo.elementAt(3) ?? "", 
      name: _userInfo.elementAt(4) ?? "",
      homeDirectory: _userInfo.elementAt(5) ?? "",
      loginShell: _userInfo.elementAt(6) ?? "/bin/bash",
    );
  }
}
