part of "../features/aria2c_socket.dart";

extension Aria2SocketExtension on Aria2cSocket {
  // Stream for Aria2ErrorResponse
  Stream<Aria2ErrorResponse> get errorStream => _behaviorSubject.stream
      .transform(Aria2Transformers.transformErrorResponse());

  // Stream for Aria2MethodResponse
  Stream<Aria2MethodResponse> get methodStream => _behaviorSubject.stream
      .transform(Aria2Transformers.transformMethodResponse());

  // Stream for Aria2Notification
  Stream<Aria2Notification> get notificationStream => _behaviorSubject.stream
      .transform(Aria2Transformers.transformNotification());

  // Stream for active tasks
  Stream<List<Aria2cTask>> get aria2cActiveTasks =>
      methodStream.transform(Aria2Transformers.transformActiveTasks());

  // Stream for waiting tasks
  Stream<List<Aria2cTask>> get aria2cWaitingTasks =>
      methodStream.transform(Aria2Transformers.transformWaitingTasks());

  // Stream for completed tasks
  Stream<List<Aria2cTask>> get aria2cCompletedTasks =>
      methodStream.transform(Aria2Transformers.transformCompletedTasks());

  Stream<Aria2cVersion> get aria2cVersion =>
      methodStream.transform(Aria2Transformers.transformAria2cVersion());

  // Method to close the stream when done
  void dispose() {
    _behaviorSubject.close();
  }
}
