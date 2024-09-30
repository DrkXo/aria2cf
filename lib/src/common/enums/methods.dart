import 'package:aria2cf/src/common/models/parser/parser.dart';

enum Aria2cRpcMethod {
  unpauseAll('aria2.unpauseAll'),
  unpause('aria2.unpause'),
  tellWaiting('aria2.tellWaiting'),
  tellStopped('aria2.tellStopped'),
  tellStatus('aria2.tellStatus'),
  tellActive('aria2.tellActive'),
  shutdown('aria2.shutdown'),
  saveSession('aria2.saveSession'),
  removeDownloadResult('aria2.removeDownloadResult'),
  remove('aria2.remove'),
  purgeDownloadResult('aria2.purgeDownloadResult'),
  pauseAll('aria2.pauseAll'),
  pause('aria2.pause'),
  systemMultiCall('system.multicall'),
  systemListNotifications('system.listNotifications'),
  systemListMethods('system.listMethods'),
  getUris('aria2.getUris'),
  getSessionInfo('aria2.getSessionInfo'),
  getServers('aria2.getServers'),
  getPeers('aria2.getPeers'),
  getOption('aria2.getOption'),
  getGlobalOption('aria2.getGlobalOption'),
  getFiles('aria2.getFiles'),
  forceShutdown('aria2.forceShutdown'),
  forceRemove('aria2.forceRemove'),
  forcePause('aria2.forcePause'),
  changeUri('aria2.changeUri'),
  changePosition('aria2.changePosition'),
  changeOption('aria2.changeOption'),
  changeGlobalOption('aria2.changeGlobalOption'),
  addUri('aria2.addUri'),
  addTorrent('aria2.addTorrent'),
  forcePauseAll('aria2.forcePauseAll'),
  addMetaLink('aria2.addMetalink'),
  getVersion('aria2.getVersion'),
  getGlobalStat('aria2.getGlobalStat');

  final String name;

  const Aria2cRpcMethod(this.name);

  Map<String, dynamic> toMap() {
    return {
      "method": name,
      "params": [],
    };
  }

  // Convert from string to enum value
  static Aria2cRpcMethod fromJson(String json) {
    return Aria2cRpcMethod.values.singleWhere((e) => e.name == json,
        orElse: () => throw ArgumentError('Invalid method name'));
  }

  @override
  String toString() => name;
}

extension Aria2cRpcMethodExtension on Aria2cRpcMethod {
  Aria2cRequest toAria2cRequest({
    required String secret,
    required List params,
  }) {
    return Aria2cRequest(
      secret: secret,
      method: this,
      params: params,
    );
  }
}
