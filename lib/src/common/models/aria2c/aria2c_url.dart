part of 'aria2c_models_index.dart';

enum Aria2cUrlStatus {
  @JsonValue('used')
  used('used'),
  @JsonValue('waiting')
  waiting('waiting');

  const Aria2cUrlStatus(this.name);

  final String name;
}

@JsonSerializable()
class Aria2cUrl {
  Aria2cUrl();

  late String url;
  @JsonKey(name: 'status')
  late Aria2cUrlStatus status;

  factory Aria2cUrl.fromJson(Map<String, dynamic> json) =>
      _$Aria2cUrlFromJson(json);
  Map<String, dynamic> toJson() => _$Aria2cUrlToJson(this);
}
