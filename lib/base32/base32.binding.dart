import 'package:base32/encodings.dart';
import 'package:hetu_script/binding.dart';
import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_std/base32/base32.dart';

class Base32ClassBinding extends HTExternalClass {
  Base32ClassBinding() : super('Base32');

  Encoding _parseEncoding(String encoding) {
    return Encoding.values.firstWhere((value) => value.name == encoding);
  }

  @override
  dynamic memberGet(String varName, {String? from}) {
    switch (varName) {
      case 'Base32.encode':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            Base32.encode(
              positionalArgs[0],
              encoding: _parseEncoding(namedArgs['encoding']),
            );
      case 'Base32.decode':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            Base32.decode(
              positionalArgs[0],
              encoding: _parseEncoding(namedArgs['encoding']),
            );
      case 'Base32.encodeString':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) {
          return Base32.encodeString(
            positionalArgs[0],
            encoding: _parseEncoding(namedArgs['encoding']),
          );
        };
      case 'Base32.decodeAsString':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            Base32.decodeAsString(
              positionalArgs[0],
              encoding: _parseEncoding(namedArgs['encoding']),
            );
      case 'Base32.encodeHexString':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            Base32.encodeHexString(
              positionalArgs[0],
              encoding: _parseEncoding(namedArgs['encoding']),
            );
      case 'Base32.decodeAsHexString':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            Base32.decodeAsHexString(
              positionalArgs[0],
              encoding: _parseEncoding(namedArgs['encoding']),
            );
      default:
        throw HTError.undefined(varName);
    }
  }
}
