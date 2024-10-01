// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_catch_stack, unused_catch_clause
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:aria2cf/src/common/models/parser/parser.dart';
import 'package:aria2cf/src/utils/logger.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part "../utils/aria2c_socket_utils.dart";

class Aria2cSocket extends Aria2cSocketUtils {
  static final Aria2cSocket _instance = Aria2cSocket._singleTone();

  factory Aria2cSocket() {
    return _instance;
  }

  // ignore: unused_field
  // late final String _secret;
  final IOWebSocketChannel _channel;
  // ignore: unused_field
  bool _isReady = false;

  Aria2cSocket._singleTone()
      : _channel = IOWebSocketChannel.connect(
          'ws://127.0.0.1:6800/jsonrpc',
        );

  final _behaviorSubject = BehaviorSubject(
    sync: true,
    onListen: () {
      logger('initialized dataStream listener!');
    },
  );

  Stream<dynamic> get dataStream => _behaviorSubject.stream;

  Future<void> connect() async {
    try {
      await _channel.ready;
      _isReady = true;
      logger('websocket ready!');
      _addListener();
    } on SocketException catch (e) {
      // Handle the exception.
      logger(e);
      rethrow;
    } on WebSocketChannelException catch (e) {
      // Handle the exception.
      logger(e);
      rethrow;
    } catch (e, s) {
      logger('catch : $e\n$s');
      rethrow;
      // Handle the exception.
    }
  }

  void _addListener() {
    _channel.stream.transform(transformer).listen(
      (data) {
        //logger('Data: $data');
        _behaviorSubject.add(data);
      },
      onError: (error) {
        //logger('Error: $error');
        _behaviorSubject.addError(error);
      },
      onDone: () {
        //logger('WebSocket closed');
        _behaviorSubject.close();
      },
    );
  }

  void sendData({
    required Aria2cRequest request,
  }) {
    _channel.sink.add(request.toJson());
  }

  void disconnect() {
    _isReady = true;
    _channel.sink.close();
  }
}
