// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_catch_stack, unused_catch_clause
import 'dart:async';
import 'dart:io';

import 'package:aria2cf/aria2cf.dart';
import 'package:aria2cf/src/utils/aria2c_socket_transformers.dart';
import 'package:aria2cf/src/utils/logger.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part "../utils/aria2c_socket_filters.dart";
part "../utils/aria2c_socket_utils.dart";

class Aria2cSocket {
  static final Aria2cSocket _instance = Aria2cSocket._singleTone();

  factory Aria2cSocket() {
    return _instance;
  }

  late IOWebSocketChannel _channel;
  bool _isReady = false;

  Aria2cSocket._singleTone();

  final _behaviorSubject = BehaviorSubject<dynamic>();

  Stream<dynamic> get dataStream => _behaviorSubject.stream;

  Future<void> connect({
    int maxAttempts = 2,
    Duration retryDelay = const Duration(seconds: 2),
  }) async {
    _channel = IOWebSocketChannel.connect(
      'ws://127.0.0.1:6800/jsonrpc',
    );

    logger('Attempting to connect to WebSocket at ws://127.0.0.1:6800/jsonrpc');

    int attempt = 0;
    while (attempt < maxAttempts) {
      try {
        await _channel.ready;
        _isReady = true;
        logger('WebSocket ready!');
        _addListener();
        return; // Exit on successful connection
      } on SocketException catch (e) {
        logger('SocketException: $e, attempt ${attempt + 1}');
      } on WebSocketChannelException catch (e) {
        logger('WebSocketChannelException: $e, attempt ${attempt + 1}');
      } catch (e, s) {
        logger('Catch error: $e\n$s');
      }
      attempt++;
      await Future.delayed(retryDelay); // Delay before retry
    }
    throw Exception(
        'Failed to connect to aria2c socket after $maxAttempts attempts');
  }

  void _addListener() {
    _channel.stream /* .transform(transformer) */ .listen(
      (data) {
        //logger('Received data: ${data.toString()}');
        _behaviorSubject.add(data);
      },
      onError: (error) {
        //logger('WebSocket error: ${error.toString()}');
        _behaviorSubject.addError(error);
      },
      onDone: () {
        //logger('WebSocket closed');
        disconnect(); // Cleanup on closure
      },
    );
  }

  void sendData({
    required Aria2cRequest request,
  }) {
    _channel.sink.add(request.toJson());
  }

  void disconnect() {
    _isReady = false;
    _channel.sink.close();
    if (!_behaviorSubject.isClosed) {
      _behaviorSubject.close(); // Ensure stream is closed
    }
    logger('WebSocket disconnected');
  }
}
