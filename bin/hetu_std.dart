import 'dart:io';

import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_std/hetu_std.dart';

void main(List<String> arguments) async {
  final hetu = Hetu();
  hetu.init();
  loadHetuStd(hetu);

  final loadCompiledPlugins = Directory("./hetu/bytecode").list();
  await for (final file in loadCompiledPlugins) {
    if (file.path.endsWith(".out")) {
      final name = file.uri.pathSegments.last.split(".").first;
      final content = await File(file.path).readAsBytes();

      hetu.loadBytecode(bytes: content, moduleName: name);
    }
  }

  hetu.eval(r"""
    import 'module:base32' as base32;
    import 'module:utf8' as utf8;
    import 'module:crypto' as crypto;

    var b32Encode = base32.Base32.encodeString("Hello, World!")
    print("Base32 Encode: ${b32Encode}")
    var b32Decode = base32.Base32.decodeAsString(b32Encode)
    print("Base32 Decode: ${b32Decode}")

    var utf8Encode = utf8.utf8.encode("Hello, World!")
    print("UTF8 Encode: ${utf8Encode}")
    var utf8Decode = utf8.utf8.decode(utf8Encode)
    print("UTF8 Decode: ${utf8Decode}")

    var sha256 = crypto.Crypto.hexEncode(crypto.Crypto.sha256(utf8Encode))
    print("SHA256: ${sha256}")
  """);
}
