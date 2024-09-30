part of "../features/aria2c_socket.dart";

void _transformResponse(data, EventSink sink) {
  try {
    logger(data);
    final response = Aria2Response.fromJson(jsonDecode(data));
    sink.add(response);
  } catch (e) {
    sink.addError('Data Parsing Error : $e');
  }
}

sealed class Aria2cSocketUtils {
  StreamTransformer transformer = StreamTransformer.fromHandlers(
    handleData: _transformResponse,
  );
}
