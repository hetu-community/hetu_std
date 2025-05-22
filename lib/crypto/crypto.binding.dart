import 'package:hetu_script/external/external_class.dart';
import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_std/crypto/crypto.dart';

class CryptoClassBinding extends HTExternalClass {
  CryptoClassBinding() : super('Crypto');

  @override
  dynamic memberGet(String varName, {String? from}) {
    switch (varName) {
      case 'sha1':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            Crypto.sha1(positionalArgs[0]);
      case 'sha256':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            Crypto.sha256(positionalArgs[0]);
      case 'sha512':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            Crypto.sha512(positionalArgs[0]);
      case 'md5':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            Crypto.md5(positionalArgs[0]);
      case 'hmacSha1':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            Crypto.hmacSha1(positionalArgs[0], positionalArgs[1]);
      case 'hmacSha256':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            Crypto.hmacSha256(positionalArgs[0], positionalArgs[1]);
      case 'hmacSha512':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            Crypto.hmacSha512(positionalArgs[0], positionalArgs[1]);
      case 'hmacMd5':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            Crypto.hmacMd5(positionalArgs[0], positionalArgs[1]);
      default:
        throw HTError.undefined(varName);
    }
  }
}
