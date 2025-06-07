import 'package:hetu_script/binding.dart';
import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_std/json/json.dart';

class JSONClassBinding extends HTExternalClass {
  JSONClassBinding() : super('JSON');

  @override
  memberGet(String varName, {String? from}) {
    switch (varName) {
      case "JSON.encode":
        return (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) => JSON.encode(positionalArgs[0]);
      case "JSON.decode":
        return (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) => JSON.decode(positionalArgs[0]);
      default:
        throw HTError.undefined(varName);
    }
  }
}
