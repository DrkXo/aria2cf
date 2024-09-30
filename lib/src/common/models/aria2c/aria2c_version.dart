part of 'aria2c_models_index.dart';

class Aria2cVersion extends Aria2Result {
  final List<String> enabledFeatures;
  final String version;

  const Aria2cVersion({
    required this.enabledFeatures,
    required this.version,
  });

  // Named constructor to create an instance from a JSON map
  factory Aria2cVersion.fromJson(Map<String, dynamic> json) {
    return Aria2cVersion(
      enabledFeatures: List<String>.from(json['enabledFeatures'] ?? []),
      version: json['version'] as String,
    );
  }

  // Method to convert the instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'enabledFeatures': enabledFeatures,
      'version': version,
    };
  }

  @override
  List<Object?> get props => [enabledFeatures, version];
}
