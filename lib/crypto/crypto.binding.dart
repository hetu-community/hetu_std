import 'package:hetu_script/external/external_class.dart';
import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_std/crypto/crypto.dart';

class CryptoClassBinding extends HTExternalClass {
  CryptoClassBinding() : super('Crypto');

  @override
  dynamic memberGet(String varName, {String? from}) {
    switch (varName) {
      case 'Crypto.sha1':
        return (
          HTEntity entity, {
          List? positionalArgs,
          Map? namedArgs,
          typeArgs,
        }) => Crypto.sha1(
          (positionalArgs?[0] as List?)?.cast<int>() as List<int>,
        );
      case 'Crypto.sha256':
        return (
          HTEntity entity, {
          List? positionalArgs,
          Map? namedArgs,
          typeArgs,
        }) => Crypto.sha256(
          (positionalArgs?[0] as List?)?.cast<int>() as List<int>,
        );
      case 'Crypto.sha512':
        return (
          HTEntity entity, {
          List? positionalArgs,
          Map? namedArgs,
          typeArgs,
        }) => Crypto.sha512(
          (positionalArgs?[0] as List?)?.cast<int>() as List<int>,
        );
      case 'Crypto.md5':
        return (
          HTEntity entity, {
          List? positionalArgs,
          Map? namedArgs,
          typeArgs,
        }) =>
            Crypto.md5((positionalArgs?[0] as List?)?.cast<int>() as List<int>);
      case 'Crypto.hmacSha1':
        return (
          HTEntity entity, {
          List? positionalArgs,
          Map? namedArgs,
          typeArgs,
        }) => Crypto.hmacSha1(
          (positionalArgs?[0] as List?)?.cast<int>() as List<int>,
          (positionalArgs?[1] as List?)?.cast<int>() as List<int>,
        );
      case 'Crypto.hmacSha256':
        return (
          HTEntity entity, {
          List? positionalArgs,
          Map? namedArgs,
          typeArgs,
        }) => Crypto.hmacSha256(
          (positionalArgs?[0] as List?)?.cast<int>() as List<int>,
          (positionalArgs?[1] as List?)?.cast<int>() as List<int>,
        );
      case 'Crypto.hmacSha512':
        return (
          HTEntity entity, {
          List? positionalArgs,
          Map? namedArgs,
          typeArgs,
        }) => Crypto.hmacSha512(
          (positionalArgs?[0] as List?)?.cast<int>() as List<int>,
          (positionalArgs?[1] as List?)?.cast<int>() as List<int>,
        );
      case 'Crypto.hmacMd5':
        return (
          HTEntity entity, {
          List? positionalArgs,
          Map? namedArgs,
          typeArgs,
        }) => Crypto.hmacMd5(
          (positionalArgs?[0] as List?)?.cast<int>() as List<int>,
          (positionalArgs?[1] as List?)?.cast<int>() as List<int>,
        );
      case 'Crypto.hexEncode':
        return (
          HTEntity entity, {
          List? positionalArgs,
          Map? namedArgs,
          typeArgs,
        }) => Crypto.hexEncode(
          (positionalArgs?[0] as List?)?.cast<int>() as List<int>,
        );
      default:
        throw HTError.undefined(varName);
    }
  }
}
