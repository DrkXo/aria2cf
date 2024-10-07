part of "parser.dart";

abstract class Aria2Response extends Equatable {
  final String _jsonrpc;

  const Aria2Response({
    required String jsonrpc,
  }) : _jsonrpc = jsonrpc;

  factory Aria2Response.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('error')) {
      return Aria2ErrorResponse.fromJson(json);
    } else if (json.containsKey('result')) {
      return Aria2MethodResponse.fromJson(json);
    } else if (json.containsKey('method')) {
      return Aria2Notification.fromJson(json);
    }
    throw Exception('Unknown aria2c response format');
  }
}

// Error response class
class Aria2ErrorResponse extends Aria2Response {
  final int code;
  final String message;

  const Aria2ErrorResponse({
    required super.jsonrpc,
    required this.code,
    required this.message,
  });

  factory Aria2ErrorResponse.fromJson(Map<String, dynamic> json) {
    return Aria2ErrorResponse(
      jsonrpc: json['jsonrpc'],
      code: json['error']['code'],
      message: json['error']['message'],
    );
  }

  @override
  List<Object?> get props => [_jsonrpc, code, message];
}

// Method response class (for success responses)
class Aria2MethodResponse extends Aria2Response {
  final String id;
  final Aria2Result result;
  final Aria2cRpcMethod method; // Enum type for method

  const Aria2MethodResponse({
    required super.jsonrpc,
    required this.id,
    required this.result,
    required this.method,
  });

  // Factory method for parsing, now with enum method parsing
  factory Aria2MethodResponse.fromJson(Map<String, dynamic> json) {
    final method = Aria2cRpcMethod.fromJson(json['id'] ?? '');
    return Aria2MethodResponse(
      jsonrpc: json['jsonrpc'],
      id: json['id'],
      result: Aria2Result.fromJson(
        method,
        json['result'],
      ), // Dynamically parse result
      method: method, // Use enum for method
    );
  }

  @override
  List<Object?> get props => [/* _jsonrpc, */ id, result, method];
}

enum Aria2NotificationType {
  downloadStart,
  downloadPause,
  downloadStop,
  downloadComplete,
  downloadError,
  btDownloadComplete,
  unknown,
}

class Aria2Notification extends Aria2Response {
  final String method;
  final List<dynamic> params;
  final Aria2NotificationType notificationType;

  const Aria2Notification({
    required super.jsonrpc,
    required this.method,
    required this.params,
    required this.notificationType,
  });

  // Factory constructor that maps the method to the enum
  factory Aria2Notification.fromJson(Map<String, dynamic> json) {
    return Aria2Notification(
      jsonrpc: json['jsonrpc'],
      method: json['method'],
      params: json['params'],
      notificationType: _parseMethod(json['method']),
    );
  }

  @override
  List<Object?> get props => [method, params, notificationType];

  // Method to parse the notification method string into an enum value
  static Aria2NotificationType _parseMethod(String method) {
    switch (method) {
      case 'aria2.onDownloadStart':
        return Aria2NotificationType.downloadStart;
      case 'aria2.onDownloadPause':
        return Aria2NotificationType.downloadPause;
      case 'aria2.onDownloadStop':
        return Aria2NotificationType.downloadStop;
      case 'aria2.onDownloadComplete':
        return Aria2NotificationType.downloadComplete;
      case 'aria2.onDownloadError':
        return Aria2NotificationType.downloadError;
      case 'aria2.onBtDownloadComplete':
        return Aria2NotificationType.btDownloadComplete;
      default:
        return Aria2NotificationType.unknown; // Handle any unknown method
    }
  }
}
