part of 'aria2c_models_index.dart';

@JsonSerializable()
class Aria2cServer {
  Aria2cServer();

  @JsonKey(name: 'index', fromJson: toInt, toJson: toString)
  int? index;
  late List<Aria2ServerItem> servers;

  factory Aria2cServer.fromJson(Map<String, dynamic> json) =>
      _$Aria2cServerFromJson(json);
  Map<String, dynamic> toJson() => _$Aria2cServerToJson(this);
}
