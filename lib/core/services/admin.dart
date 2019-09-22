import 'package:esesech/core/models/server.dart';

class AdminService {
  int _currentServer = 0;
  List<Server> servers = [
    Server(
        host: "ec2-13-126-85-121.ap-south-1.compute.amazonaws.com",
        password: "ubuntu123",
        port: 22,
        username: "ubuntu"),
  ];

  Server getCurrentServer() {
    return this.servers[this._currentServer];
  }

  void removeServer(String host) {
    Server toBeRemoved;

    for (Server server in servers) {
      if (host == server.host) {
        toBeRemoved = server;
      }
    }

    if (!(toBeRemoved == null)) {
      servers.remove(toBeRemoved);
    }
  }

  void setCurrentServer(Server server) {
    for (Server s in servers) {
      if (s.host == server.host) {
        _currentServer = servers.indexOf(s);
      }
    }
  }
}
