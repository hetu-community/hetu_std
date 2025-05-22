import 'dart:convert';

import 'package:hetu_script/external/external_class.dart';
import 'package:hetu_script/hetu_script.dart';

extension Utf8Binding on Utf8Codec {
  dynamic htFetch(String varName) {
    switch (varName) {
      case 'encode':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            encode(positionalArgs[0]) as List<int>;
      case 'decode':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            decode(
              positionalArgs[0],
              allowMalformed: namedArgs['allowMalformed'],
            );
      default:
        throw HTError.undefined(varName);
    }
  }
}

class Utf8CodecBinding extends HTExternalClass {
  Utf8CodecBinding() : super('Utf8Codec');

  @override
  dynamic memberGet(String varName, {String? from}) {
    switch (varName) {
      case 'Utf8Codec':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            Utf8Codec(allowMalformed: namedArgs['allowMalformed']);
      default:
        throw HTError.undefined(varName);
    }
  }

  @override
  dynamic instanceMemberGet(dynamic object, String varName) {
    return (object as Utf8Codec).htFetch(varName);
  }
}
