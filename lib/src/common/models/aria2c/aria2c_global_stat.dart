part of 'aria2c_models_index.dart';

@JsonSerializable()
class Aria2cGlobalStat {
  Aria2cGlobalStat();

  @JsonKey(name: 'downloadSpeed', fromJson: toInt, toJson: toString)
  int? downloadSpeed;
  @JsonKey(name: 'numActive', fromJson: toInt, toJson: toString)
  int? numActive;
  @JsonKey(name: 'numStopped', fromJson: toInt, toJson: toString)
  int? numStopped;
  @JsonKey(name: 'numStoppedTotal', fromJson: toInt, toJson: toString)
  int? numStoppedTotal;
  @JsonKey(name: 'numWaiting', fromJson: toInt, toJson: toString)
  int? numWaiting;
  @JsonKey(name: 'uploadSpeed', fromJson: toInt, toJson: toString)
  int? uploadSpeed;

  factory Aria2cGlobalStat.fromJson(Map<String, dynamic> json) =>
      _$Aria2cGlobalStatFromJson(json);
  Map<String, dynamic> toJson() => _$Aria2cGlobalStatToJson(this);
}
