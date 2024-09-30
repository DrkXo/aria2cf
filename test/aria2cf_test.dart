import 'dart:convert';

import 'package:aria2cf/src/aria2c_socket.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:aria2cf/aria2cf.dart';

void main()async {
  Aria2cSocket socket=    Aria2cSocket();
  await socket.connect().then((onValue){
    socket.sendData(jsonEncode({
      'jsonrpc': '2.0',
      'id': 'qwer',
      'method': 'aria2.addUri',
      'params': [
        [
          'https://file-examples.com/storage/fe58a1f07d66f447a9512f1/2017/04/file_example_MP4_1920_18MG.mp4'
        ]
      ]
    }));
  });

}
