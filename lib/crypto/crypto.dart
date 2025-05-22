import 'package:crypto/crypto.dart' as crypto;

class Crypto {
  static List<int> sha1(List<int> data) {
    return crypto.sha1.convert(data).bytes;
  }

  static List<int> sha256(List<int> data) {
    return crypto.sha256.convert(data).bytes;
  }

  static List<int> sha512(List<int> data) {
    return crypto.sha512.convert(data).bytes;
  }

  static List<int> md5(List<int> data) {
    return crypto.md5.convert(data).bytes;
  }

  static List<int> hmacSha1(List<int> key, List<int> data) {
    return crypto.Hmac(crypto.sha1, key).convert(data).bytes;
  }

  static List<int> hmacSha256(List<int> key, List<int> data) {
    return crypto.Hmac(crypto.sha256, key).convert(data).bytes;
  }

  static List<int> hmacSha512(List<int> key, List<int> data) {
    return crypto.Hmac(crypto.sha512, key).convert(data).bytes;
  }

  static List<int> hmacMd5(List<int> key, List<int> data) {
    return crypto.Hmac(crypto.md5, key).convert(data).bytes;
  }

  static String hexEncode(List<int> bytes) {
    return crypto.Digest(bytes).toString();
  }
}
