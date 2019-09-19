import 'package:ssh/ssh.dart';

class SshService {
  static Future<String> executeCommand(String host, String command) async {
    try {
      SSHClient client = SSHClient(
        host: "ec2-13-234-30-69.ap-south-1.compute.amazonaws.com",
        username: "ubuntu",
        port: 22,
        passwordOrKey: {
          "privateKey":
              "d0:1a:96:37:61:8d:f1:99:d3:9f:fd:05:93:9d:a4:0a:ae:52:ea:d8",
          "passphrase": "",
        },
      );

      await client.connect();
      String result = await client.execute(command);
      return result;
    } catch (e) {
      print("SSH Exception Occurred: $e");
      return null;
    }
  }
}
