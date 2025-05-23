import 'dart:io';

import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_std/base32/base32.binding.dart';
import 'package:hetu_std/crypto/crypto.binding.dart';
import 'package:hetu_std/http/http.binding.dart';
import 'package:hetu_std/timer/duration.binding.dart';
import 'package:hetu_std/timer/timer.binding.dart';
import 'package:hetu_std/utf8/utf8.binding.dart';
import 'package:path/path.dart';

abstract class HetuStdLoader {
  static void loadBindings(Hetu hetu) {
    final classes = [
      HttpBaseOptionsClassBinding(),
      RequestOptionsClassBinding(),
      HttpResponseClassBinding(),
      HttpClientClassBinding(),
      DurationClassBinding(),
      TimerClassBinding(),
      Utf8CodecBinding(),
      Base32ClassBinding(),
      CryptoClassBinding(),
    ];

    for (final classBinding in classes) {
      hetu.interpreter.bindExternalClass(classBinding);
    }
  }

  static Future<void> loadBytecodePureDart(
    Hetu hetu,
    String packagePath,
  ) async {
    final byteCodeFile = File(join(packagePath, 'lib/assets/bytecode/std.out'));
    final byteCode = await byteCodeFile.readAsBytes();

    hetu.loadBytecode(bytes: byteCode, moduleName: 'std');
  }

  static Future<void> loadBytecodeFlutter(Hetu hetu) async {
    final byteCodeFile = File('packages/hetu_std/assets/bytecode/std.out');
    final byteCode = await byteCodeFile.readAsBytes();

    hetu.loadBytecode(bytes: byteCode, moduleName: 'std');
  }
}
