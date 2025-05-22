import 'package:base32/encodings.dart';
import 'package:hetu_script/binding.dart';
import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_std/base32/base32.dart';

class Base32ClassBinding extends HTExternalClass {
  Base32ClassBinding() : super('Base32');

  @override
  dynamic memberGet(String varName, {String? from}) {
    switch (varName) {
      case 'encode':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            Base32.encode(
              positionalArgs[0],
              encoding: namedArgs['encoding'] ?? Encoding.standardRFC4648,
            );
      case 'decode':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            Base32.decode(
              positionalArgs[0],
              encoding: namedArgs['encoding'] ?? Encoding.standardRFC4648,
            );
      case 'encodeString':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) {
          return Base32.encodeString(
              positionalArgs[0],
              encoding: namedArgs['encoding'] ?? Encoding.standardRFC4648,
            );
        };
      case 'decodeAsString':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            Base32.decodeAsString(
              positionalArgs[0],
              encoding: namedArgs['encoding'] ?? Encoding.standardRFC4648,
            );
      case 'encodeHexString':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            Base32.encodeHexString(
              positionalArgs[0],
              encoding: namedArgs['encoding'] ?? Encoding.standardRFC4648,
            );
      case 'decodeAsHexString':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            Base32.decodeAsHexString(
              positionalArgs[0],
              encoding: namedArgs['encoding'] ?? Encoding.standardRFC4648,
            );
      default:
        throw HTError.undefined(varName);
    }
  }
}
