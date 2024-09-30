part of 'aria2c_models_index.dart';

@JsonSerializable()
class Aria2cSessionInfo {
  Aria2cSessionInfo();

  late String sessionId;

  factory Aria2cSessionInfo.fromJson(Map<String, dynamic> json) =>
      _$Aria2cSessionInfoFromJson(json);
  Map<String, dynamic> toJson() => _$Aria2cSessionInfoToJson(this);
}
