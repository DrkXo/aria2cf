part of 'aria2c_models_index.dart';

@JsonSerializable()
class Aria2ServerItem {
  Aria2ServerItem();

  late String uri;
  late String currentUri;
  late String downloadSpeed;

  factory Aria2ServerItem.fromJson(Map<String, dynamic> json) =>
      _$Aria2ServerItemFromJson(json);
  Map<String, dynamic> toJson() => _$Aria2ServerItemToJson(this);
}
