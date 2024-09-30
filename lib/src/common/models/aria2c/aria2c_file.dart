part of 'aria2c_models_index.dart';

@JsonSerializable()
class Aria2cFile {
  Aria2cFile();

  @JsonKey(name: 'completedLength', fromJson: toInt, toJson: toString)
  int? completedLength;
  @JsonKey(name: 'index', fromJson: toInt, toJson: toString)
  int? index;
  @JsonKey(name: 'length', fromJson: toInt, toJson: toString)
  int? length;
  String? path;
  @JsonKey(name: 'selected', fromJson: toBool, toJson: toString)
  bool? selected;
  List? uris;

  factory Aria2cFile.fromJson(Map<String, dynamic> json) =>
      _$Aria2cFileFromJson(json);
  Map<String, dynamic> toJson() => _$Aria2cFileToJson(this);
}
