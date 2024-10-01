part of "parser.dart";

class Aria2cRequest {
  final String jsonrpc = '2.0';
  late final String id;
  String secret;
  Aria2cRpcMethod method;
  List params;

  Aria2cRequest.addUrl({
    required this.secret,
    required List<String> urls,
  })  : method = Aria2cRpcMethod.addUri,
        params = [urls] {
    id = method.name;
    _format();
  }

  Aria2cRequest.addMetaLink({
    required this.secret,
    required String base64Metalink,
  })  : method = Aria2cRpcMethod.addMetaLink,
        params = [base64Metalink] {
    id = method.name;
    _format();
  }

  Aria2cRequest.addTorrent({
    required this.secret,
    required String base64Torrent,
  })  : method = Aria2cRpcMethod.addTorrent,
        params = [base64Torrent] {
    id = method.name;
    _format();
  }

  Aria2cRequest.getGlobalStat({
    required this.secret,
  })  : method = Aria2cRpcMethod.getGlobalStat,
        params = [] {
    id = method.name;
    _format();
  }

  Aria2cRequest.getVersion({
    required this.secret,
  })  : method = Aria2cRpcMethod.getVersion,
        params = [] {
    id = method.name;
    _format();
  }

  Aria2cRequest.forcePauseAll({
    required this.secret,
  })  : method = Aria2cRpcMethod.forcePauseAll,
        params = [] {
    id = method.name;
    _format();
  }
  Aria2cRequest.changeGlobalOption({
    required this.secret,
    required Aria2cOption option,
  })  : method = Aria2cRpcMethod.changeGlobalOption,
        params = [option.toJson()] {
    id = method.name;
    _format();
  }
  Aria2cRequest.changeOption({
    required this.secret,
    required String gid,
    required Aria2cOption option,
  })  : method = Aria2cRpcMethod.changeOption,
        params = [gid, option.toJson()] {
    id = method.name;
    _format();
  }
  Aria2cRequest.changePosition({
    required this.secret,
    required String gid,
    required int pos,
    required String how,
  })  : method = Aria2cRpcMethod.changePosition,
        params = [gid, pos, how] {
    id = method.name;
    _format();
  }
  Aria2cRequest.changeUri({
    required this.secret,
    required String gid,
    required int fileIndex,
    required List<String> delUris,
    required List<String> addUris,
  })  : method = Aria2cRpcMethod.changeUri,
        params = [gid, fileIndex, delUris, addUris] {
    id = method.name;
    _format();
  }
  Aria2cRequest.forcePause({
    required this.secret,
    required String gid,
  })  : method = Aria2cRpcMethod.forcePause,
        params = [gid] {
    id = method.name;
    _format();
  }
  Aria2cRequest.forceRemove({
    required this.secret,
    required String gid,
  })  : method = Aria2cRpcMethod.forceRemove,
        params = [gid] {
    id = method.name;
    _format();
  }
  Aria2cRequest.forceShutdown({
    required this.secret,
    required String gid,
  })  : method = Aria2cRpcMethod.forceShutdown,
        params = [gid] {
    id = method.name;
    _format();
  }
  Aria2cRequest.getFiles({
    required this.secret,
    required String gid,
  })  : method = Aria2cRpcMethod.getFiles,
        params = [gid] {
    id = method.name;
    _format();
  }
  Aria2cRequest.getGlobalOption({
    required this.secret,
  })  : method = Aria2cRpcMethod.getGlobalOption,
        params = [] {
    id = method.name;
    _format();
  }
  Aria2cRequest.getOption({
    required this.secret,
    required String gid,
  })  : method = Aria2cRpcMethod.getOption,
        params = [gid] {
    id = method.name;
    _format();
  }
  Aria2cRequest.getPeers({
    required this.secret,
    required String gid,
  })  : method = Aria2cRpcMethod.getPeers,
        params = [gid] {
    id = method.name;
    _format();
  }
  Aria2cRequest.getServers({
    required this.secret,
    required String gid,
  })  : method = Aria2cRpcMethod.getServers,
        params = [gid] {
    id = method.name;
    _format();
  }
  Aria2cRequest.getSessionInfo({
    required this.secret,
  })  : method = Aria2cRpcMethod.getSessionInfo,
        params = [] {
    id = method.name;
    _format();
  }
  Aria2cRequest.getUris({
    required this.secret,
    required String gid,
  })  : method = Aria2cRpcMethod.getUris,
        params = [gid] {
    id = method.name;
    _format();
  }
  Aria2cRequest.systemListMethods({
    required this.secret,
  })  : method = Aria2cRpcMethod.systemListMethods,
        params = [] {
    id = method.name;
    _format();
  }
  Aria2cRequest.systemListNotifications({
    required this.secret,
  })  : method = Aria2cRpcMethod.systemListNotifications,
        params = [] {
    id = method.name;
    _format();
  }
  Aria2cRequest.systemMultiCall({
    required this.secret,
    required List<Aria2cRpcMethod> methods,
    //required List<String> params,
  })  : method = Aria2cRpcMethod.systemMultiCall,
        params = [
          ...methods.map((x) => x.toMap()),
        ] {
    id = method.name;
    _format();
  }

  Aria2cRequest.pause({
    required this.secret,
    required String gid,
  })  : method = Aria2cRpcMethod.pause,
        params = [gid] {
    id = method.name;
    _format();
  }
  Aria2cRequest.pauseAll({
    required this.secret,
  })  : method = Aria2cRpcMethod.pauseAll,
        params = [] {
    id = method.name;
    _format();
  }
  Aria2cRequest.purgeDownloadResult({
    required this.secret,
  })  : method = Aria2cRpcMethod.purgeDownloadResult,
        params = [] {
    id = method.name;
    _format();
  }
  Aria2cRequest.remove({
    required this.secret,
    required String gid,
  })  : method = Aria2cRpcMethod.remove,
        params = [gid] {
    id = method.name;
    _format();
  }
  Aria2cRequest.removeDownloadResult({
    required this.secret,
    required String gid,
  })  : method = Aria2cRpcMethod.removeDownloadResult,
        params = [gid] {
    id = method.name;
    _format();
  }
  Aria2cRequest.saveSession({
    required this.secret,
  })  : method = Aria2cRpcMethod.saveSession,
        params = [] {
    id = method.name;
    _format();
  }
  Aria2cRequest.shutdown({
    required this.secret,
  })  : method = Aria2cRpcMethod.shutdown,
        params = [] {
    id = method.name;
    _format();
  }
  Aria2cRequest.tellActive({
    required this.secret,
  })  : method = Aria2cRpcMethod.tellActive,
        params = [] {
    id = method.name;
    _format();
  }
  Aria2cRequest.tellStatus({
    required this.secret,
    required String gid,
  })  : method = Aria2cRpcMethod.tellStatus,
        params = [gid] {
    id = method.name;
    _format();
  }
  Aria2cRequest.tellStopped({
    required this.secret,
    required int offset,
    required int count,
  })  : method = Aria2cRpcMethod.tellStopped,
        params = [offset, count] {
    id = method.name;
    _format();
  }
  Aria2cRequest.tellWaiting({
    required this.secret,
    required int offset,
    required int count,
  })  : method = Aria2cRpcMethod.tellWaiting,
        params = [offset, count] {
    id = method.name;
    _format();
  }
  Aria2cRequest.unpause({
    required this.secret,
    required String gid,
  })  : method = Aria2cRpcMethod.unpause,
        params = [gid] {
    id = method.name;
    _format();
  }
  Aria2cRequest.unpauseAll({
    required this.secret,
  })  : method = Aria2cRpcMethod.unpauseAll,
        params = [] {
    id = method.name;
    _format();
  }

  void _format() {
    if (method != Aria2cRpcMethod.systemMultiCall) {
      params.insert(0, "token:$secret");
    } else {
      for (var i = 0; i < params.length; i++) {
        params[i]["params"].insert(0, "token:$secret");
      }
      params = [params];
    }
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jsonrpc': jsonrpc,
      'id': id,
      'method': method.name,
      'params': params,
    };
  }

  String toJson() => json.encode(toMap());
}
