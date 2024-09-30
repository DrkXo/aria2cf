// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aria2c_models_index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Aria2cFile _$Aria2cFileFromJson(Map<String, dynamic> json) => Aria2cFile()
  ..completedLength = toInt(json['completedLength'])
  ..index = toInt(json['index'])
  ..length = toInt(json['length'])
  ..path = json['path'] as String?
  ..selected = toBool(json['selected'])
  ..uris = json['uris'] as List<dynamic>?;

Map<String, dynamic> _$Aria2cFileToJson(Aria2cFile instance) =>
    <String, dynamic>{
      'completedLength': toString(instance.completedLength),
      'index': toString(instance.index),
      'length': toString(instance.length),
      'path': instance.path,
      'selected': toString(instance.selected),
      'uris': instance.uris,
    };

Aria2cGlobalStat _$Aria2cGlobalStatFromJson(Map<String, dynamic> json) =>
    Aria2cGlobalStat()
      ..downloadSpeed = toInt(json['downloadSpeed'])
      ..numActive = toInt(json['numActive'])
      ..numStopped = toInt(json['numStopped'])
      ..numStoppedTotal = toInt(json['numStoppedTotal'])
      ..numWaiting = toInt(json['numWaiting'])
      ..uploadSpeed = toInt(json['uploadSpeed']);

Map<String, dynamic> _$Aria2cGlobalStatToJson(Aria2cGlobalStat instance) =>
    <String, dynamic>{
      'downloadSpeed': toString(instance.downloadSpeed),
      'numActive': toString(instance.numActive),
      'numStopped': toString(instance.numStopped),
      'numStoppedTotal': toString(instance.numStoppedTotal),
      'numWaiting': toString(instance.numWaiting),
      'uploadSpeed': toString(instance.uploadSpeed),
    };

Aria2cOption _$Aria2cOptionFromJson(Map<String, dynamic> json) => Aria2cOption()
  ..allowOverwrite = toBool(json['allow-overwrite'])
  ..allowPieceLengthChange = toBool(json['allow-piece-length-change'])
  ..alwaysResume = toBool(json['always-resume'])
  ..asyncDns = toBool(json['async-dns'])
  ..autoFileRenaming = toBool(json['auto-file-renaming'])
  ..autoSaveInterval = toInt(json['auto-save-interval'])
  ..btDetachSeedOnly = toBool(json['bt-detach-seed-only'])
  ..btEnableHookAfterHashCheck = toBool(json['bt-enable-hook-after-hash-check'])
  ..btEnableLpd = toBool(json['bt-enable-lpd'])
  ..btForceEncryption = toBool(json['bt-force-encryption'])
  ..btHashCheckSeed = toBool(json['bt-hash-check-seed'])
  ..btLoadSavedMetadata = toBool(json['bt-load-saved-metadata'])
  ..btMaxOpenFiles = toInt(json['bt-max-open-files'])
  ..btMaxPeers = toInt(json['bt-max-peers'])
  ..btMetadataOnly = toBool(json['bt-metadata-only'])
  ..btMinCryptoLevel = json['bt-min-crypto-level'] as String?
  ..btPrioritizePiece = json['bt-prioritize-piece'] as String?
  ..btRemoveUnselectedFile = toBool(json['bt-remove-unselected-file'])
  ..btRequestPeerSpeedLimit = toInt(json['bt-request-peer-speed-limit'])
  ..btRequireCrypto = toBool(json['bt-require-crypto'])
  ..btSaveMetadata = toBool(json['bt-save-metadata'])
  ..btSeedUnverified = toBool(json['bt-seed-unverified'])
  ..btStopTimeout = toInt(json['bt-stop-timeout'])
  ..btTracker = json['bt-tracker'] as String?
  ..btTrackerConnectTimeout = toInt(json['bt-tracker-connect-timeout'])
  ..btTrackerInterval = toInt(json['bt-tracker-interval'])
  ..btTrackerTimeout = toInt(json['bt-tracker-timeout'])
  ..caCertificate = json['ca-certificate'] as String?
  ..checkCertificate = toBool(json['check-certificate'])
  ..checkIntegrity = toBool(json['check-integrity'])
  ..conditionalGet = toBool(json['conditional-get'])
  ..confPath = json['conf-path'] as String?
  ..connectTimeout = toInt(json['connect-timeout'])
  ..consoleLogLevel = json['console-log-level'] as String?
  ..contentDispositionDefaultUtf8 =
      toBool(json['content-disposition-default-utf8'])
  ..continue_ = toBool(json['continue'])
  ..daemon = toBool(json['daemon'])
  ..deferredInput = toBool(json['deferred-input'])
  ..dhtEntryPoint = json['dht-entry-point'] as String?
  ..dhtEntryPoint6 = json['dht-entry-point6'] as String?
  ..dhtFilePath = json['dht-file-path'] as String?
  ..dhtFilePath6 = json['dht-file-path6'] as String?
  ..dhtListenPort = json['dht-listen-port'] as String?
  ..dhtMessageTimeout = toInt(json['dht-message-timeout'])
  ..dir = json['dir'] as String?
  ..disableIpv6 = toBool(json['disable-ipv6'])
  ..diskCache = toInt(json['disk-cache'])
  ..downloadResult = json['download-result'] as String?
  ..dryRun = toBool(json['dry-run'])
  ..dscp = toInt(json['dscp'])
  ..enableColor = toBool(json['enable-color'])
  ..enableDht = toBool(json['enable-dht'])
  ..enableDht6 = toBool(json['enable-dht6'])
  ..enableHttpKeepAlive = toBool(json['enable-http-keep-alive'])
  ..enableHttpPipelining = toBool(json['enable-http-pipelining'])
  ..enableMmap = toBool(json['enable-mmap'])
  ..enablePeerExchange = toBool(json['enable-peer-exchange'])
  ..enableRpc = toBool(json['enable-rpc'])
  ..eventPoll = toBool(json['event-poll'])
  ..fileAllocation = json['file-allocation'] as String?
  ..followMetalink = toBool(json['follow-metalink'])
  ..followTorrent = toBool(json['follow-torrent'])
  ..forceSave = toBool(json['force-save'])
  ..ftpPasv = toBool(json['ftp-pasv'])
  ..ftpReuseConnection = toBool(json['ftp-reuse-connection'])
  ..ftpType = json['ftp-type'] as String?
  ..hashCheckOnly = toBool(json['hash-check-only'])
  ..help = json['help'] as String?
  ..httpAcceptGzip = toBool(json['http-accept-gzip'])
  ..httpAuthChallenge = toBool(json['http-auth-challenge'])
  ..httpNoCache = toBool(json['http-no-cache'])
  ..httpWantDigest = toBool(json['http-want-digest'])
  ..humanReadable = toBool(json['human-readable'])
  ..keepUnfinishedDownloadResult =
      toBool(json['keep-unfinished-download-result'])
  ..listenPort = json['listen-port'] as String?
  ..logLevel = json['log-level'] as String?
  ..lowestSpeedLimit = toInt(json['lowest-speed-limit'])
  ..maxConcurrentDownloads = toInt(json['max-concurrent-downloads'])
  ..maxConnectionPerServer = toInt(json['max-connection-per-server'])
  ..maxDownloadLimit = toInt(json['max-download-limit'])
  ..maxDownloadResult = toInt(json['max-download-result'])
  ..maxFileNotFound = toInt(json['max-file-not-found'])
  ..maxMmapLimit = toInt(json['max-mmap-limit'])
  ..maxOverallDownloadLimit = toInt(json['max-overall-download-limit'])
  ..maxOverallUploadLimit = toInt(json['max-overall-upload-limit'])
  ..maxResumeFailureTries = toInt(json['max-resume-failure-tries'])
  ..maxTries = toInt(json['max-tries'])
  ..maxUploadLimit = toInt(json['max-upload-limit'])
  ..metalinkEnableUniqueProtocol =
      json['metalink-enable-unique-protocol'] as String?
  ..metalinkPreferredProtocol = toBool(json['metalink-preferred-protocol'])
  ..minSplitSize = toInt(json['min-split-size'])
  ..minTlsVersion = json['min-tls-version'] as String?
  ..netrcPath = json['netrc-path'] as String?
  ..noConf = toBool(json['no-conf'])
  ..noFileAllocationLimit = toInt(json['no-file-allocation-limit'])
  ..noNetrc = toBool(json['no-netrc'])
  ..onDownloadComplete = json['on-download-complete'] as String?
  ..onDownloadStop = json['on-download-stop'] as String?
  ..optimizeConcurrentDownloads = toBool(json['optimize-concurrent-downloads'])
  ..parameterizedUri = toBool(json['parameterized-uri'])
  ..pauseMetadata = toBool(json['pause-metadata'])
  ..peerAgent = json['peer-agent'] as String?
  ..peerIdPrefix = json['peer-id-prefix'] as String?
  ..pieceLength = toInt(json['piece-length'])
  ..proxyMethod = json['proxy-method'] as String?
  ..quiet = toBool(json['quiet'])
  ..realtimeChunkChecksum = toBool(json['realtime-chunk-checksum'])
  ..remoteTime = toBool(json['remote-time'])
  ..removeControlFile = toBool(json['remove-control-file'])
  ..retryOn400 = toBool(json['retry-on-400'])
  ..retryOn403 = toBool(json['retry-on-403'])
  ..retryOn406 = toBool(json['retry-on-406'])
  ..retryOnUnknown = toBool(json['retry-on-unknown'])
  ..retryWait = toInt(json['retry-wait'])
  ..reuseUri = toBool(json['reuse-uri'])
  ..rlimitNofile = toInt(json['rlimit-nofile'])
  ..rpcAllowOriginAll = json['rpc-allow-origin-all'] as String?
  ..rpcListenAll = toBool(json['rpc-listen-all'])
  ..rpcListenPort = json['rpc-listen-port'] as String?
  ..rpcMaxRequestSize = toInt(json['rpc-max-request-size'])
  ..rpcSaveUploadMetadata = toBool(json['rpc-save-upload-metadata'])
  ..rpcSecure = toBool(json['rpc-secure'])
  ..saveNotFound = toBool(json['save-not-found'])
  ..saveSession = json['save-session'] as String?
  ..saveSessionInterval = toInt(json['save-session-interval'])
  ..seedRatio = json['seed-ratio'] as String?
  ..seedTime = toInt(json['seed-time'])
  ..serverStatTimeout = toInt(json['server-stat-timeout'])
  ..showConsoleReadout = toBool(json['show-console-readout'])
  ..showFiles = toBool(json['show-files'])
  ..socketRecvBufferSize = toInt(json['socket-recv-buffer-size'])
  ..split = toInt(json['split'])
  ..stderr = toBool(json['stderr'])
  ..stop = toInt(json['stop'])
  ..streamPieceSelector = json['stream-piece-selector'] as String?
  ..summaryInterval = toInt(json['summary-interval'])
  ..timeout = toInt(json['timeout'])
  ..truncateConsoleReadout = toBool(json['truncate-console-readout'])
  ..uriSelector = json['uri-selector'] as String?
  ..useHead = toBool(json['use-head'])
  ..userAgent = json['user-agent'] as String?;

Map<String, dynamic> _$Aria2cOptionToJson(Aria2cOption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('allow-overwrite', toString(instance.allowOverwrite));
  writeNotNull(
      'allow-piece-length-change', toString(instance.allowPieceLengthChange));
  writeNotNull('always-resume', toString(instance.alwaysResume));
  writeNotNull('async-dns', toString(instance.asyncDns));
  writeNotNull('auto-file-renaming', toString(instance.autoFileRenaming));
  writeNotNull('auto-save-interval', toString(instance.autoSaveInterval));
  writeNotNull('bt-detach-seed-only', toString(instance.btDetachSeedOnly));
  writeNotNull('bt-enable-hook-after-hash-check',
      toString(instance.btEnableHookAfterHashCheck));
  writeNotNull('bt-enable-lpd', toString(instance.btEnableLpd));
  writeNotNull('bt-force-encryption', toString(instance.btForceEncryption));
  writeNotNull('bt-hash-check-seed', toString(instance.btHashCheckSeed));
  writeNotNull(
      'bt-load-saved-metadata', toString(instance.btLoadSavedMetadata));
  writeNotNull('bt-max-open-files', toString(instance.btMaxOpenFiles));
  writeNotNull('bt-max-peers', toString(instance.btMaxPeers));
  writeNotNull('bt-metadata-only', toString(instance.btMetadataOnly));
  writeNotNull('bt-min-crypto-level', instance.btMinCryptoLevel);
  writeNotNull('bt-prioritize-piece', instance.btPrioritizePiece);
  writeNotNull(
      'bt-remove-unselected-file', toString(instance.btRemoveUnselectedFile));
  writeNotNull('bt-request-peer-speed-limit',
      toString(instance.btRequestPeerSpeedLimit));
  writeNotNull('bt-require-crypto', toString(instance.btRequireCrypto));
  writeNotNull('bt-save-metadata', toString(instance.btSaveMetadata));
  writeNotNull('bt-seed-unverified', toString(instance.btSeedUnverified));
  writeNotNull('bt-stop-timeout', toString(instance.btStopTimeout));
  writeNotNull('bt-tracker', instance.btTracker);
  writeNotNull(
      'bt-tracker-connect-timeout', toString(instance.btTrackerConnectTimeout));
  writeNotNull('bt-tracker-interval', toString(instance.btTrackerInterval));
  writeNotNull('bt-tracker-timeout', toString(instance.btTrackerTimeout));
  writeNotNull('ca-certificate', instance.caCertificate);
  writeNotNull('check-certificate', toString(instance.checkCertificate));
  writeNotNull('check-integrity', toString(instance.checkIntegrity));
  writeNotNull('conditional-get', toString(instance.conditionalGet));
  writeNotNull('conf-path', instance.confPath);
  writeNotNull('connect-timeout', toString(instance.connectTimeout));
  writeNotNull('console-log-level', instance.consoleLogLevel);
  writeNotNull('content-disposition-default-utf8',
      toString(instance.contentDispositionDefaultUtf8));
  writeNotNull('continue', toString(instance.continue_));
  writeNotNull('daemon', toString(instance.daemon));
  writeNotNull('deferred-input', toString(instance.deferredInput));
  writeNotNull('dht-entry-point', instance.dhtEntryPoint);
  writeNotNull('dht-entry-point6', instance.dhtEntryPoint6);
  writeNotNull('dht-file-path', instance.dhtFilePath);
  writeNotNull('dht-file-path6', instance.dhtFilePath6);
  writeNotNull('dht-listen-port', instance.dhtListenPort);
  writeNotNull('dht-message-timeout', toString(instance.dhtMessageTimeout));
  writeNotNull('dir', instance.dir);
  writeNotNull('disable-ipv6', toString(instance.disableIpv6));
  writeNotNull('disk-cache', toString(instance.diskCache));
  writeNotNull('download-result', instance.downloadResult);
  writeNotNull('dry-run', toString(instance.dryRun));
  writeNotNull('dscp', toString(instance.dscp));
  writeNotNull('enable-color', toString(instance.enableColor));
  writeNotNull('enable-dht', toString(instance.enableDht));
  writeNotNull('enable-dht6', toString(instance.enableDht6));
  writeNotNull(
      'enable-http-keep-alive', toString(instance.enableHttpKeepAlive));
  writeNotNull(
      'enable-http-pipelining', toString(instance.enableHttpPipelining));
  writeNotNull('enable-mmap', toString(instance.enableMmap));
  writeNotNull('enable-peer-exchange', toString(instance.enablePeerExchange));
  writeNotNull('enable-rpc', toString(instance.enableRpc));
  writeNotNull('event-poll', toString(instance.eventPoll));
  writeNotNull('file-allocation', instance.fileAllocation);
  writeNotNull('follow-metalink', toString(instance.followMetalink));
  writeNotNull('follow-torrent', toString(instance.followTorrent));
  writeNotNull('force-save', toString(instance.forceSave));
  writeNotNull('ftp-pasv', toString(instance.ftpPasv));
  writeNotNull('ftp-reuse-connection', toString(instance.ftpReuseConnection));
  writeNotNull('ftp-type', instance.ftpType);
  writeNotNull('hash-check-only', toString(instance.hashCheckOnly));
  writeNotNull('help', instance.help);
  writeNotNull('http-accept-gzip', toString(instance.httpAcceptGzip));
  writeNotNull('http-auth-challenge', toString(instance.httpAuthChallenge));
  writeNotNull('http-no-cache', toString(instance.httpNoCache));
  writeNotNull('http-want-digest', toString(instance.httpWantDigest));
  writeNotNull('human-readable', toString(instance.humanReadable));
  writeNotNull('keep-unfinished-download-result',
      toString(instance.keepUnfinishedDownloadResult));
  writeNotNull('listen-port', instance.listenPort);
  writeNotNull('log-level', instance.logLevel);
  writeNotNull('lowest-speed-limit', toString(instance.lowestSpeedLimit));
  writeNotNull(
      'max-concurrent-downloads', toString(instance.maxConcurrentDownloads));
  writeNotNull(
      'max-connection-per-server', toString(instance.maxConnectionPerServer));
  writeNotNull('max-download-limit', toString(instance.maxDownloadLimit));
  writeNotNull('max-download-result', toString(instance.maxDownloadResult));
  writeNotNull('max-file-not-found', toString(instance.maxFileNotFound));
  writeNotNull('max-mmap-limit', toString(instance.maxMmapLimit));
  writeNotNull(
      'max-overall-download-limit', toString(instance.maxOverallDownloadLimit));
  writeNotNull(
      'max-overall-upload-limit', toString(instance.maxOverallUploadLimit));
  writeNotNull(
      'max-resume-failure-tries', toString(instance.maxResumeFailureTries));
  writeNotNull('max-tries', toString(instance.maxTries));
  writeNotNull('max-upload-limit', toString(instance.maxUploadLimit));
  writeNotNull(
      'metalink-enable-unique-protocol', instance.metalinkEnableUniqueProtocol);
  writeNotNull('metalink-preferred-protocol',
      toString(instance.metalinkPreferredProtocol));
  writeNotNull('min-split-size', toString(instance.minSplitSize));
  writeNotNull('min-tls-version', instance.minTlsVersion);
  writeNotNull('netrc-path', instance.netrcPath);
  writeNotNull('no-conf', toString(instance.noConf));
  writeNotNull(
      'no-file-allocation-limit', toString(instance.noFileAllocationLimit));
  writeNotNull('no-netrc', toString(instance.noNetrc));
  writeNotNull('on-download-complete', instance.onDownloadComplete);
  writeNotNull('on-download-stop', instance.onDownloadStop);
  writeNotNull('optimize-concurrent-downloads',
      toString(instance.optimizeConcurrentDownloads));
  writeNotNull('parameterized-uri', toString(instance.parameterizedUri));
  writeNotNull('pause-metadata', toString(instance.pauseMetadata));
  writeNotNull('peer-agent', instance.peerAgent);
  writeNotNull('peer-id-prefix', instance.peerIdPrefix);
  writeNotNull('piece-length', toString(instance.pieceLength));
  writeNotNull('proxy-method', instance.proxyMethod);
  writeNotNull('quiet', toString(instance.quiet));
  writeNotNull(
      'realtime-chunk-checksum', toString(instance.realtimeChunkChecksum));
  writeNotNull('remote-time', toString(instance.remoteTime));
  writeNotNull('remove-control-file', toString(instance.removeControlFile));
  writeNotNull('retry-on-400', toString(instance.retryOn400));
  writeNotNull('retry-on-403', toString(instance.retryOn403));
  writeNotNull('retry-on-406', toString(instance.retryOn406));
  writeNotNull('retry-on-unknown', toString(instance.retryOnUnknown));
  writeNotNull('retry-wait', toString(instance.retryWait));
  writeNotNull('reuse-uri', toString(instance.reuseUri));
  writeNotNull('rlimit-nofile', toString(instance.rlimitNofile));
  writeNotNull('rpc-allow-origin-all', instance.rpcAllowOriginAll);
  writeNotNull('rpc-listen-all', toString(instance.rpcListenAll));
  writeNotNull('rpc-listen-port', instance.rpcListenPort);
  writeNotNull('rpc-max-request-size', toString(instance.rpcMaxRequestSize));
  writeNotNull(
      'rpc-save-upload-metadata', toString(instance.rpcSaveUploadMetadata));
  writeNotNull('rpc-secure', toString(instance.rpcSecure));
  writeNotNull('save-not-found', toString(instance.saveNotFound));
  writeNotNull('save-session', instance.saveSession);
  writeNotNull('save-session-interval', toString(instance.saveSessionInterval));
  writeNotNull('seed-ratio', instance.seedRatio);
  writeNotNull('seed-time', toString(instance.seedTime));
  writeNotNull('server-stat-timeout', toString(instance.serverStatTimeout));
  writeNotNull('show-console-readout', toString(instance.showConsoleReadout));
  writeNotNull('show-files', toString(instance.showFiles));
  writeNotNull(
      'socket-recv-buffer-size', toString(instance.socketRecvBufferSize));
  writeNotNull('split', toString(instance.split));
  writeNotNull('stderr', toString(instance.stderr));
  writeNotNull('stop', toString(instance.stop));
  writeNotNull('stream-piece-selector', instance.streamPieceSelector);
  writeNotNull('summary-interval', toString(instance.summaryInterval));
  writeNotNull('timeout', toString(instance.timeout));
  writeNotNull(
      'truncate-console-readout', toString(instance.truncateConsoleReadout));
  writeNotNull('uri-selector', instance.uriSelector);
  writeNotNull('use-head', toString(instance.useHead));
  writeNotNull('user-agent', instance.userAgent);
  return val;
}

Aria2cPeer _$Aria2cPeerFromJson(Map<String, dynamic> json) => Aria2cPeer()
  ..amChoking = toBool(json['amChoking'])
  ..bitfield = json['bitfield'] as String?
  ..downloadSpeed = toInt(json['downloadSpeed'])
  ..ip = json['ip'] as String?
  ..peerChoking = toBool(json['peerChoking'])
  ..peerId = json['peerId'] as String?
  ..port = toInt(json['port'])
  ..seeder = toBool(json['seeder'])
  ..uploadSpeed = toInt(json['uploadSpeed']);

Map<String, dynamic> _$Aria2cPeerToJson(Aria2cPeer instance) =>
    <String, dynamic>{
      'amChoking': toString(instance.amChoking),
      'bitfield': instance.bitfield,
      'downloadSpeed': toString(instance.downloadSpeed),
      'ip': instance.ip,
      'peerChoking': toString(instance.peerChoking),
      'peerId': instance.peerId,
      'port': toString(instance.port),
      'seeder': toString(instance.seeder),
      'uploadSpeed': toString(instance.uploadSpeed),
    };

Aria2cServer _$Aria2cServerFromJson(Map<String, dynamic> json) => Aria2cServer()
  ..index = toInt(json['index'])
  ..servers = (json['servers'] as List<dynamic>)
      .map((e) => Aria2ServerItem.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$Aria2cServerToJson(Aria2cServer instance) =>
    <String, dynamic>{
      'index': toString(instance.index),
      'servers': instance.servers,
    };

Aria2ServerItem _$Aria2ServerItemFromJson(Map<String, dynamic> json) =>
    Aria2ServerItem()
      ..uri = json['uri'] as String
      ..currentUri = json['currentUri'] as String
      ..downloadSpeed = json['downloadSpeed'] as String;

Map<String, dynamic> _$Aria2ServerItemToJson(Aria2ServerItem instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'currentUri': instance.currentUri,
      'downloadSpeed': instance.downloadSpeed,
    };

Aria2cSessionInfo _$Aria2cSessionInfoFromJson(Map<String, dynamic> json) =>
    Aria2cSessionInfo()..sessionId = json['sessionId'] as String;

Map<String, dynamic> _$Aria2cSessionInfoToJson(Aria2cSessionInfo instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
    };

Aria2cTask _$Aria2cTaskFromJson(Map<String, dynamic> json) => Aria2cTask()
  ..bitField = json['bitField'] as String?
  ..bittorrent = json['bittorrent'] as Map<String, dynamic>?
  ..belongsTo = json['belongsTo'] as String?
  ..completedLength = toInt(json['completedLength'])
  ..connections = toInt(json['connections'])
  ..dir = json['dir'] as String?
  ..downloadSpeed = toInt(json['downloadSpeed'])
  ..errorCode = toInt(json['errorCode'])
  ..errorMessage = json['errorMessage'] as String?
  ..files = toAria2cFilesList(json['files'])
  ..following = json['following'] as String?
  ..followedBy =
      (json['followedBy'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..gid = json['gid'] as String?
  ..infoHash = json['infoHash'] as String?
  ..numPieces = toInt(json['numPieces'])
  ..numSeeders = toInt(json['numSeeders'])
  ..pieceLength = toInt(json['pieceLength'])
  ..status = $enumDecodeNullable(_$Aria2cTaskStatusEnumMap, json['status'])
  ..seeder = toBool(json['seeder'])
  ..totalLength = toInt(json['totalLength'])
  ..uploadLength = toInt(json['uploadLength'])
  ..uploadSpeed = toInt(json['uploadSpeed'])
  ..verifiedLength = toInt(json['verifiedLength'])
  ..verifyIntegrityPending = toBool(json['verifyIntegrityPending']);

Map<String, dynamic> _$Aria2cTaskToJson(Aria2cTask instance) =>
    <String, dynamic>{
      'bitField': instance.bitField,
      'bittorrent': instance.bittorrent,
      'belongsTo': instance.belongsTo,
      'completedLength': toString(instance.completedLength),
      'connections': toString(instance.connections),
      'dir': instance.dir,
      'downloadSpeed': toString(instance.downloadSpeed),
      'errorCode': toString(instance.errorCode),
      'errorMessage': instance.errorMessage,
      'files': toString(instance.files),
      'following': instance.following,
      'followedBy': instance.followedBy,
      'gid': instance.gid,
      'infoHash': instance.infoHash,
      'numPieces': toString(instance.numPieces),
      'numSeeders': toString(instance.numSeeders),
      'pieceLength': toString(instance.pieceLength),
      'status': _$Aria2cTaskStatusEnumMap[instance.status],
      'seeder': toString(instance.seeder),
      'totalLength': toString(instance.totalLength),
      'uploadLength': toString(instance.uploadLength),
      'uploadSpeed': toString(instance.uploadSpeed),
      'verifiedLength': toString(instance.verifiedLength),
      'verifyIntegrityPending': toString(instance.verifyIntegrityPending),
    };

const _$Aria2cTaskStatusEnumMap = {
  Aria2cTaskStatus.waiting: 'waiting',
  Aria2cTaskStatus.active: 'active',
  Aria2cTaskStatus.paused: 'pause',
  Aria2cTaskStatus.error: 'error',
  Aria2cTaskStatus.complete: 'complete',
  Aria2cTaskStatus.removed: 'removed',
};

Aria2cUrl _$Aria2cUrlFromJson(Map<String, dynamic> json) => Aria2cUrl()
  ..url = json['url'] as String
  ..status = $enumDecode(_$Aria2cUrlStatusEnumMap, json['status']);

Map<String, dynamic> _$Aria2cUrlToJson(Aria2cUrl instance) => <String, dynamic>{
      'url': instance.url,
      'status': _$Aria2cUrlStatusEnumMap[instance.status]!,
    };

const _$Aria2cUrlStatusEnumMap = {
  Aria2cUrlStatus.used: 'used',
  Aria2cUrlStatus.waiting: 'waiting',
};

Aria2cVersion _$Aria2cVersionFromJson(Map<String, dynamic> json) =>
    Aria2cVersion()
      ..enabledFeatures = json['enabledFeatures'] as List<dynamic>
      ..version = json['version'] as String;

Map<String, dynamic> _$Aria2cVersionToJson(Aria2cVersion instance) =>
    <String, dynamic>{
      'enabledFeatures': instance.enabledFeatures,
      'version': instance.version,
    };
