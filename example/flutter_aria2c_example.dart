// ignore_for_file: unused_local_variable

import 'package:aria2cf/src/aria2c_socket.dart';
import 'package:aria2cf/src/common/enums/methods.dart';
import 'package:aria2cf/src/common/models/request.dart';

void main() async {
  Aria2cSocket aria2cSocket = Aria2cSocket();
  await aria2cSocket.connect().then((onValue) {
    aria2cSocket.sendData(
      request: Aria2cRequest(
        secret: 'flutter',
        method: Aria2cRpcMethod.addUri,
        params: [
          [
            'https://file-examples.com/storage/fe58a1f07d66f447a9512f1/2017/04/file_example_MP4_1920_18MG.mp4'
          ]
        ],
      ),
    );
  });

  //aria2cSocket.disconnect();
}
