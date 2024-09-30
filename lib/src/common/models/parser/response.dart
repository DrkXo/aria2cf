part of "parser.dart";

abstract class Aria2Response extends Equatable {
  final String jsonrpc;

  const Aria2Response({required this.jsonrpc});

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
  String toString() => 'Error(code: $code, message: $message)';

  @override
  List<Object?> get props => [jsonrpc, code, message];
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
          method, json['result']), // Dynamically parse result
      method: method, // Use enum for method
    );
  }

  @override
  String toString() =>
      'MethodResponse(id: $id, method: $method, result: $result)';

  @override
  List<Object?> get props => [jsonrpc, id, result, method];
}

class Aria2Notification extends Aria2Response {
  final String method;
  final List<dynamic> params;

  const Aria2Notification({
    required super.jsonrpc,
    required this.method,
    required this.params,
  });

  factory Aria2Notification.fromJson(Map<String, dynamic> json) {
    return Aria2Notification(
      jsonrpc: json['jsonrpc'],
      method: json['method'],
      params: json['params'],
    );
  }

  @override
  String toString() => 'Notification(method: $method, params: $params)';

  @override
  List<Object?> get props => [method, params];
}
