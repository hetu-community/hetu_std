import 'dart:io';

import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_std/hetu_std.dart';

void main(List<String> arguments) async {
  final hetu = Hetu();
  hetu.init();
  loadHetuStd(hetu);

  final content = await File("./assets/bytecode/std.out").readAsBytes();

  hetu.loadBytecode(bytes: content, moduleName: 'std');

  hetu.eval(r"""
    import 'module:std' as std

    var { Base32, utf8, Crypto } = std

    var b32Encode = Base32.encodeString("Hello, World!")
    print("Base32 Encode: ${b32Encode}")
    var b32Decode = Base32.decodeAsString(b32Encode)
    print("Base32 Decode: ${b32Decode}")

    var utf8Encode = utf8.encode("Hello, World!")
    print("UTF8 Encode: ${utf8Encode}")
    var utf8Decode = utf8.decode(utf8Encode)
    print("UTF8 Decode: ${utf8Decode}")

    var sha256 = Crypto.hexEncode(Crypto.sha256(utf8Encode))
    print("SHA256: ${sha256}")
  """);
}
