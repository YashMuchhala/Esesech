import 'package:ssh/ssh.dart';

class SshHelper {
  static const String _HOST =
      "ec2-13-235-243-163.ap-south-1.compute.amazonaws.com";
  static const String _USERNAME = "ubuntu";
  static const int _PORT = 22;
  static const String _PASSWORD = "ubuntu123";

  static Future<String> execute(String host, String command) async {
    SSHClient client = SSHClient(
      host: _HOST,
      username: _USERNAME,
      port: _PORT,
      passwordOrKey: _PASSWORD,
    );
    try {
      await client.connect();
      String result = await client.execute(command);
      await client.disconnect();
      return result;
    } catch (e) {
      print("SSH Exception Occurred: $e");
      await client.disconnect();
      return null;
    }
  }

  static Future<String> writeToShell(String command) async {
    SSHClient client = SSHClient(
      host: _HOST,
      username: _USERNAME,
      port: _PORT,
      passwordOrKey: _PASSWORD,
    );
    try {
      var result = await client.startShell(
        ptyType: "xterm",
        callback: (dynamic res) {
          print(res);
        },
      );
      await client.writeToShell(command);
      await client.closeShell();
      return result;
    } catch (e) {
      print("SSH Exception Occurred: $e");
      await client.closeShell();
      return null;
    }
  }
}
