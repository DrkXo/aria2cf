part of 'aria2c_models_index.dart';

@JsonSerializable()
class Aria2cPeer {
  Aria2cPeer();

  @JsonKey(name: 'amChoking', fromJson: toBool, toJson: toString)
  bool? amChoking;
  String? bitfield;
  @JsonKey(name: 'downloadSpeed', fromJson: toInt, toJson: toString)
  int? downloadSpeed;
  String? ip;
  @JsonKey(name: 'peerChoking', fromJson: toBool, toJson: toString)
  bool? peerChoking;
  String? peerId;
  @JsonKey(name: 'port', fromJson: toInt, toJson: toString)
  int? port;
  @JsonKey(name: 'seeder', fromJson: toBool, toJson: toString)
  bool? seeder;
  @JsonKey(name: 'uploadSpeed', fromJson: toInt, toJson: toString)
  int? uploadSpeed;

  factory Aria2cPeer.fromJson(Map<String, dynamic> json) =>
      _$Aria2cPeerFromJson(json);
  Map<String, dynamic> toJson() => _$Aria2cPeerToJson(this);
}
