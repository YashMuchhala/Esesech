import 'package:flutter/foundation.dart';

class Server {
  String host;
  int port;
  String username;
  String password;

  Server({
    @required this.host,
    @required this.port,
    @required this.username,
    @required this.password,
  });
}
