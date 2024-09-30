part of 'aria2c_models_index.dart';

@JsonSerializable()
class Aria2cVersion {
  Aria2cVersion();

  late List enabledFeatures;
  late String version;

  factory Aria2cVersion.fromJson(Map<String, dynamic> json) =>
      _$Aria2cVersionFromJson(json);
  Map<String, dynamic> toJson() => _$Aria2cVersionToJson(this);
}
