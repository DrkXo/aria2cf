// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:aria2cf/src/aria2c_socket.dart';


void main() async {

  Aria2cSocket aria2cSocket = Aria2cSocket();
  await aria2cSocket.connect().then((onValue) {
    aria2cSocket.sendData(jsonEncode({
      'jsonrpc': '2.0',
      'id': 'qwer',

    }));
  });

  //aria2cSocket.disconnect();
}
