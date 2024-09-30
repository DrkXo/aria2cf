import 'package:aria2cf/src/common/enums/methods.dart';

abstract class Aria2Result {
  const Aria2Result();

  factory Aria2Result.fromJson(Aria2cRpcMethod method, dynamic resultJson) {
    switch (method) {
      /*  case Aria2cRpcMethod.tellStatus:
        return TellStatusResult.fromJson(resultJson);
      case Aria2cRpcMethod.addUri:
        return AddUriResult.fromJson(resultJson);
      // Add more methods as needed */
      default:
        return RawResult(resultJson); // Generic result for unhandled cases
    }
  }
}

// Generic class for handling unparsed results
class RawResult extends Aria2Result {
  final dynamic result;
  RawResult(this.result);

  @override
  String toString() => 'RawResult(result: $result)';
}
