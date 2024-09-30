import 'package:aria2cf/src/common/models/aria2c/aria2c_models_index.dart';

bool? toBool(str) {
  return str is String ? str == "true" : null;
}

toString(anything) {
  return anything?.toString();
}

int? toInt(arg) {
  return arg == null ? null : (arg is String ? int.parse(arg) : arg);
}

List<Aria2cFile>? toAria2cFilesList(data) {
  return data != null && data is List
      ? List.from(data).map((element) => Aria2cFile.fromJson(element)).toList()
      : null;
}
