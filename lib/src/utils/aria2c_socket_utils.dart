part of "../features/aria2c_socket.dart";

void socketDataTransformer(data, EventSink sink) {
  try {
    logger(data);
    var decoded = jsonDecode(data);
    sink.add(decoded['result']);
  } catch (e) {
    logger('socketDataTransformer Error : $e');
    sink.add(data);
  }
}

sealed class Aria2cSocketUtils {
  StreamTransformer transformer = StreamTransformer.fromHandlers(
    handleData: socketDataTransformer,
  );
}
