part of "parser.dart";

abstract class Aria2Result extends Equatable {
  const Aria2Result();

  factory Aria2Result.fromJson(Aria2cRpcMethod method, dynamic resultJson) {
    switch (method) {
      /*  case Aria2cRpcMethod.tellStatus:
        return TellStatusResult.fromJson(resultJson);
      case Aria2cRpcMethod.addUri:
        return AddUriResult.fromJson(resultJson);
      // Add more methods as needed */

      /* case Aria2cRpcMethod.addUri:
        return resultJson; */
      default:
        return RawResult(resultJson); // Generic result for unhandled cases
    }
  }
}

class RawResult extends Aria2Result {
  final dynamic result;
  const RawResult(this.result);

  @override
  List<Object?> get props => [result];
}
