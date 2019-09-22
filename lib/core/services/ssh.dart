import 'package:ssh/ssh.dart';

class SSHService {
  static const String HOST =
      "ec2-13-126-85-121.ap-south-1.compute.amazonaws.com";
  static const String _USERNAME = "ubuntu";
  static const int _PORT = 22;
  static const String _PASSWORD = "ubuntu123";

  static Future<String> execute(String command) async {
    SSHClient client = SSHClient(
      host: HOST,
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

  static Future<List<String>> executeMultiple(List<String> commands) async {
    SSHClient client = SSHClient(
      host: HOST,
      username: _USERNAME,
      port: _PORT,
      passwordOrKey: _PASSWORD,
    );
    List<String> results = [];
    await client.connect();
    for (String command in commands) {
      try {
        results.add(await client.execute(command));
        print("results: " + results.toString());
      } catch (e) {
        print("SSH Exception Occurred: $e");
        await client.disconnect();
        return null;
      }
    }
    await client.disconnect();
    return results;
  }

  // static Future<String> writeToShell(String command) async {
  //   SSHClient client = SSHClient(
  //     host: _HOST,
  //     username: _USERNAME,
  //     port: _PORT,
  //     passwordOrKey: _PASSWORD,
  //   );
  //   try {
  //     var result = await client.startShell(
  //       ptyType: "xterm",
  //       callback: (dynamic res) {
  //         print(res);
  //       },
  //     );
  //     await client.writeToShell(command);
  //     await client.closeShell();
  //     return result;
  //   } catch (e) {
  //     print("SSH Exception Occurred: $e");
  //     await client.closeShell();
  //     return null;
  //   }
  // }
}
