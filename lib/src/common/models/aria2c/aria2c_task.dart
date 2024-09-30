part of 'aria2c_models_index.dart';

enum Aria2cTaskStatus {
  @JsonValue('waiting')
  waiting('waiting'),
  @JsonValue('active')
  active('active'),
  @JsonValue('pause')
  paused('paused'),
  @JsonValue('error')
  error('error'),
  @JsonValue('complete')
  complete('complete'),
  @JsonValue('removed')
  removed('removed');

  const Aria2cTaskStatus(this.name);
  final String name;
}

@JsonSerializable()
class Aria2cTask {
  Aria2cTask();

  String? bitField;
  Map<String, dynamic>? bittorrent;
  String? belongsTo;
  @JsonKey(name: 'completedLength', fromJson: toInt, toJson: toString)
  int? completedLength;
  @JsonKey(name: 'connections', fromJson: toInt, toJson: toString)
  int? connections;
  String? dir;
  @JsonKey(name: 'downloadSpeed', fromJson: toInt, toJson: toString)
  int? downloadSpeed;
  @JsonKey(name: 'errorCode', fromJson: toInt, toJson: toString)
  int? errorCode;
  String? errorMessage;
  @JsonKey(name: 'files', fromJson: toAria2cFilesList, toJson: toString)
  List<Aria2cFile>? files;
  @JsonKey(name: 'following')
  String? following;
  @JsonKey(name: 'followedBy')
  List<String>? followedBy;
  String? gid;
  String? infoHash;
  @JsonKey(name: 'numPieces', fromJson: toInt, toJson: toString)
  int? numPieces;
  @JsonKey(name: 'numSeeders', fromJson: toInt, toJson: toString)
  int? numSeeders;
  @JsonKey(name: 'pieceLength', fromJson: toInt, toJson: toString)
  int? pieceLength;
  @JsonKey(name: 'status')
  Aria2cTaskStatus? status;
  @JsonKey(name: 'seeder', fromJson: toBool, toJson: toString)
  bool? seeder;
  @JsonKey(name: 'totalLength', fromJson: toInt, toJson: toString)
  int? totalLength;
  @JsonKey(name: 'uploadLength', fromJson: toInt, toJson: toString)
  int? uploadLength;
  @JsonKey(name: 'uploadSpeed', fromJson: toInt, toJson: toString)
  int? uploadSpeed;
  @JsonKey(name: 'verifiedLength', fromJson: toInt, toJson: toString)
  int? verifiedLength;
  @JsonKey(name: 'verifyIntegrityPending', fromJson: toBool, toJson: toString)
  bool? verifyIntegrityPending;

  factory Aria2cTask.fromJson(Map<String, dynamic> json) =>
      _$Aria2cTaskFromJson(json);
  Map<String, dynamic> toJson() => _$Aria2cTaskToJson(this);
}
