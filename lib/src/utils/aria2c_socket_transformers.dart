import 'dart:async';
import 'dart:convert';

import 'package:aria2cf/aria2cf.dart';

sealed class Aria2Transformers {
  // Transformer for Aria2ErrorResponse
  static StreamTransformer<dynamic, Aria2ErrorResponse>
      transformErrorResponse() {
    return StreamTransformer<dynamic, Aria2ErrorResponse>.fromHandlers(
      handleData: (data, sink) {
        final jsonData = _decodeJson(data);
        if (jsonData?.containsKey('error') ?? false) {
          final response = Aria2ErrorResponse.fromJson(jsonData!);
          sink.add(response);
        }
      },
    );
  }

  // Transformer for Aria2MethodResponse
  static StreamTransformer<dynamic, Aria2MethodResponse>
      transformMethodResponse() {
    return StreamTransformer<dynamic, Aria2MethodResponse>.fromHandlers(
      handleData: (data, sink) {
        final jsonData = _decodeJson(data);
        if (jsonData?.containsKey('result') ?? false) {
          final response = Aria2MethodResponse.fromJson(jsonData!);
          sink.add(response);
        }
      },
    );
  }

  // Transformer for Aria2Notification
  static StreamTransformer<dynamic, Aria2Notification> transformNotification() {
    return StreamTransformer<dynamic, Aria2Notification>.fromHandlers(
      handleData: (data, sink) {
        final jsonData = _decodeJson(data);
        if (jsonData?.containsKey('method') ?? false) {
          final response = Aria2Notification.fromJson(jsonData!);
          sink.add(response);
        }
      },
    );
  }

  // Transformer for active tasks from Aria2MethodResponse
  static StreamTransformer<Aria2MethodResponse, List<Aria2cTask>>
      transformActiveTasks() {
    return StreamTransformer<Aria2MethodResponse,
        List<Aria2cTask>>.fromHandlers(
      handleData: (Aria2MethodResponse data, EventSink<List<Aria2cTask>> sink) {
        if (data.method == Aria2cRpcMethod.tellActive) {
          final tasks = (data.result as RawResult).parsedData();

          sink.add(tasks);
        }
      },
    );
  }

  // Transformer for waiting tasks from Aria2MethodResponse
  static StreamTransformer<Aria2MethodResponse, List<Aria2cTask>>
      transformWaitingTasks() {
    return StreamTransformer<Aria2MethodResponse,
        List<Aria2cTask>>.fromHandlers(
      handleData: (Aria2MethodResponse data, EventSink<List<Aria2cTask>> sink) {
        if (data.method == Aria2cRpcMethod.tellWaiting) {
          final tasks = (data.result as RawResult).parsedData();
          sink.add(tasks);
        }
      },
    );
  }

  // Transformer for completed tasks from Aria2MethodResponse
  static StreamTransformer<Aria2MethodResponse, List<Aria2cTask>>
      transformCompletedTasks() {
    return StreamTransformer<Aria2MethodResponse,
        List<Aria2cTask>>.fromHandlers(
      handleData: (Aria2MethodResponse data, EventSink<List<Aria2cTask>> sink) {
        if (data.method == Aria2cRpcMethod.tellStopped) {
          final tasks = (data.result as RawResult).parsedData();
          sink.add(tasks);
        }
      },
    );
  }

  static StreamTransformer<Aria2MethodResponse, Aria2cVersion>
      transformAria2cVersion() {
    return StreamTransformer<Aria2MethodResponse, Aria2cVersion>.fromHandlers(
      handleData: (Aria2MethodResponse data, EventSink<Aria2cVersion> sink) {
        if (data.method == Aria2cRpcMethod.getVersion) {
          final tasks = (data.result as RawResult).parsedData();
          sink.add(tasks);
        }
      },
    );
  }

  // Helper method for JSON decoding with null checks
  static Map<String, dynamic>? _decodeJson(dynamic data) {
    if (data == null) return null;
    try {
      return jsonDecode(data);
    } catch (_) {
      return null;
    }
  }
}
