part of "../features/aria2c_socket.dart";

extension Aria2SocketExtension on Aria2cSocket {
  // Stream for Aria2ErrorResponse
  Stream<Aria2ErrorResponse> get errorStreamStream => _behaviorSubject.stream
      .where((data) => _decodeJson(data)?.containsKey('error') ?? false)
      .map((data) => Aria2ErrorResponse.fromJson(_decodeJson(data)!));

  // Stream for Aria2MethodResponse
  Stream<Aria2MethodResponse> get methodStreamStream => _behaviorSubject.stream
      .where((data) => _decodeJson(data)?.containsKey('result') ?? false)
      .map((data) => Aria2MethodResponse.fromJson(_decodeJson(data)!));

  // Stream for Aria2Notification
  Stream<Aria2Notification> get notificationStreamStream =>
      _behaviorSubject.stream
          .where((data) => _decodeJson(data)?.containsKey('method') ?? false)
          .map((data) => Aria2Notification.fromJson(_decodeJson(data)!));

  // Stream for active tasks
  Stream<List<Aria2cTask>> get aria2cActiveTasksStream =>
      _transformMethodStream<List<Aria2cTask>>(Aria2cRpcMethod.tellActive);

  // Stream for waiting tasks
  Stream<List<Aria2cTask>> get aria2cWaitingTasksStream =>
      _transformMethodStream<List<Aria2cTask>>(Aria2cRpcMethod.tellWaiting);

  // Stream for completed tasks
  Stream<List<Aria2cTask>> get aria2cCompletedTasksStream =>
      _transformMethodStream<List<Aria2cTask>>(Aria2cRpcMethod.tellStopped);

  // Stream for Aria2cVersion
  Stream<Aria2cVersion> get aria2cVersionStream =>
      _transformMethodStream<Aria2cVersion>(Aria2cRpcMethod.getVersion);

  // Stream for Aria2cUrl
  Stream<Aria2cUrl> get aria2cGetUrisStream =>
      _transformMethodStream<Aria2cUrl>(Aria2cRpcMethod.getUris);

  // Stream for Aria2cSessionInfo
  Stream<Aria2cSessionInfo> get aria2cGetSessionInfoStream =>
      _transformMethodStream<Aria2cSessionInfo>(Aria2cRpcMethod.getSessionInfo);

  // Stream for List<Aria2cServer>
  Stream<List<Aria2cServer>> get aria2cGetServersStream =>
      _transformMethodStream<List<Aria2cServer>>(Aria2cRpcMethod.getServers);

  // Stream for List<Aria2cPeer>
  Stream<List<Aria2cPeer>> get aria2cGetPeersStream =>
      _transformMethodStream<List<Aria2cPeer>>(Aria2cRpcMethod.getPeers);

  // Stream for getOption
  Stream<Aria2cOption> get aria2cGetOptionStream =>
      _transformMethodStream<Aria2cOption>(Aria2cRpcMethod.getOption);

  // Stream for getGlobalOption
  Stream<Aria2cOption> get aria2cGetGlobalOptionStream =>
      _transformMethodStream<Aria2cOption>(Aria2cRpcMethod.getGlobalOption);

  // Stream for getFiles
  Stream<List<Aria2cFile>> get aria2cFileStream =>
      _transformMethodStream<List<Aria2cFile>>(Aria2cRpcMethod.getFiles);

  // Stream for changeUri
  Stream<List<int>> get aria2cChangeUriStream =>
      _transformMethodStream<List<int>>(Aria2cRpcMethod.changeUri);

  // Stream for changePosition
  Stream<List<int>> get aria2cChangePositionStream =>
      _transformMethodStream<List<int>>(Aria2cRpcMethod.changePosition);

  // Stream for Aria2cGlobalStat
  Stream<Aria2cGlobalStat> get aria2cGlobalStatStream =>
      _transformMethodStream<Aria2cGlobalStat>(Aria2cRpcMethod.getGlobalStat);

  // Helper method for JSON decoding with null checks
  Map<String, dynamic>? _decodeJson(dynamic data) {
    if (data == null) return null;
    try {
      return jsonDecode(data);
    } catch (_) {
      return null;
    }
  }

  // Stream transformer for method responses based on a given method
  Stream<T> _transformMethodStream<T>(Aria2cRpcMethod method) {
    return methodStreamStream
        .where((data) => data.method == method)
        .map((data) {
      final result = (data.result as RawResult).parsedData();
      if (result is T) {
        return result;
      } else {
        throw Exception('Expected type $T but got ${result.runtimeType}');
      }
    });
  }

  // Method to close the stream when done
  void dispose() {
    _behaviorSubject.close();
  }
}
