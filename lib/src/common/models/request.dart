// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:aria2cf/src/common/enums/methods.dart';

class Aria2cRequest {
  final String jsonrpc = '2.0';
  final String id;
  String secret;
  Aria2cRpcMethod method;
  List params;

  Aria2cRequest({
    required this.secret,
    required this.method,
    required this.params,
    String? id,
  }) : id = id ?? secret {
    _format();
  }

  void _format() {
    if (method != Aria2cRpcMethod.systemMultiCall) {
      params.insert(0, "token:$secret");
    } else {
      for (var i = 0; i < params.length; i++) {
        params[i]["params"].insert(0, "token:$secret");
      }
      params = [params];
    }
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jsonrpc': jsonrpc,
      'id': id,
      'method': method.name,
      'params': params,
    };
  }

  String toJson() => json.encode(toMap());
}
