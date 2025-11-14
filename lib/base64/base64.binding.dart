import 'package:hetu_script/binding.dart';
import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_std/base64/base64.dart';

class Base64ClassBinding extends HTExternalClass {
  Base64ClassBinding() : super('Base64');

  @override
  dynamic memberGet(String varName, {String? from}) {
    switch (varName) {
      case 'Base64.encode':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            Base64.encode((positionalArgs[0] as List).cast<int>());
      case 'Base64.decode':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            Base64.decode(positionalArgs[0]);
      default:
        throw HTError.undefined(varName);
    }
  }
}
