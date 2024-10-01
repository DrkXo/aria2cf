part of "parser.dart";

abstract class Aria2Result extends Equatable {
  const Aria2Result();

  factory Aria2Result.fromJson(Aria2cRpcMethod method, dynamic resultJson) {
    switch (method) {
      /*  case Aria2cRpcMethod.tellStatus:
        return TellStatusResult.fromJson(resultJson);
      case Aria2cRpcMethod.addUri:
        return AddUriResult.fromJson(resultJson);
      // Add more methods as needed */

      case Aria2cRpcMethod.getVersion:
        return Aria2cVersion.fromJson(resultJson);
      default:
        return RawResult(
          result: resultJson,
          method: method,
        ); // Generic result for unhandled cases
    }
  }
}

class RawResult extends Aria2Result {
  final Aria2cRpcMethod method;
  final dynamic _result;

  const RawResult({
    required dynamic result,
    required this.method,
  }) : _result = result;

  @override
  List<Object?> get props => [method, parsedData()];
}

extension RawResultExtension on RawResult {
  dynamic parsedData() {
    switch (method) {
      case Aria2cRpcMethod.addMetaLink:
      case Aria2cRpcMethod.forcePauseAll:
      case Aria2cRpcMethod.addTorrent:
      case Aria2cRpcMethod.addUri:
      case Aria2cRpcMethod.changeGlobalOption:
      case Aria2cRpcMethod.changeOption:
      case Aria2cRpcMethod.forcePause:
      case Aria2cRpcMethod.forceRemove:
      case Aria2cRpcMethod.forceShutdown:
      case Aria2cRpcMethod.pause:
      case Aria2cRpcMethod.pauseAll:
      case Aria2cRpcMethod.purgeDownloadResult:
      case Aria2cRpcMethod.remove:
      case Aria2cRpcMethod.removeDownloadResult:
      case Aria2cRpcMethod.saveSession:
      case Aria2cRpcMethod.shutdown:
      case Aria2cRpcMethod.unpauseAll:
      case Aria2cRpcMethod.unpause:
        return _result as String;

      case Aria2cRpcMethod.tellWaiting:
        return _result
            .map<Aria2cTask>((dt) => Aria2cTask.fromJson(dt))
            .toList();

      case Aria2cRpcMethod.tellStopped:
        return _result
            .map<Aria2cTask>((dt) => Aria2cTask.fromJson(dt))
            .toList();

      case Aria2cRpcMethod.tellStatus:
        return Aria2cTask.fromJson(_result);

      case Aria2cRpcMethod.tellActive:
        return _result
            .map<Aria2cTask>((dt) => Aria2cTask.fromJson(dt))
            .toList();

      case Aria2cRpcMethod.systemMultiCall:
        return _result;
      case Aria2cRpcMethod.systemListNotifications:
        return _result;
      case Aria2cRpcMethod.systemListMethods:
        return _result;
      case Aria2cRpcMethod.getUris:
        return _result.map<Aria2cUrl>((dt) => Aria2cUrl.fromJson(dt)).toList();
      case Aria2cRpcMethod.getSessionInfo:
        return Aria2cSessionInfo.fromJson(_result);
      case Aria2cRpcMethod.getServers:
        return _result
            .map<Aria2cServer>((dt) => Aria2cServer.fromJson(dt))
            .toList();
      case Aria2cRpcMethod.getPeers:
        return _result
            .map<Aria2cPeer>((dt) => Aria2cPeer.fromJson(dt))
            .toList();
      case Aria2cRpcMethod.getOption:
        return Aria2cOption.fromJson(_result);
      case Aria2cRpcMethod.getGlobalOption:
        return Aria2cOption.fromJson(_result);
      case Aria2cRpcMethod.getFiles:
        return _result
            .map<Aria2cFile>((dt) => Aria2cFile.fromJson(dt))
            .toList();

      case Aria2cRpcMethod.changeUri:
        return _result as List<int>;
      case Aria2cRpcMethod.changePosition:
        return _result as int;

      case Aria2cRpcMethod.getVersion:
        return Aria2cVersion.fromJson(_result);
      case Aria2cRpcMethod.getGlobalStat:
        return Aria2cGlobalStat.fromJson(_result);
    }
  }
}
