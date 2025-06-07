import 'dart:io';

import 'package:flutter/services.dart';
import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_std/base32/base32.binding.dart';
import 'package:hetu_std/bitwise/bitwise.binding.dart';
import 'package:hetu_std/crypto/crypto.binding.dart';
import 'package:hetu_std/datetime/datetime.binding.dart';
import 'package:hetu_std/http/http.binding.dart';
import 'package:hetu_std/stream/stream.binding.dart';
import 'package:hetu_std/stream/stream_controller.binding.dart';
import 'package:hetu_std/stream/stream_subscription.binding.dart';
import 'package:hetu_std/timer/duration.binding.dart';
import 'package:hetu_std/timer/timer.binding.dart';
import 'package:hetu_std/utf8/utf8.binding.dart';
import 'package:path/path.dart';

export 'package:hetu_std/stream/stream.dart';

abstract class HetuStdLoader {
  static void loadBindings(Hetu hetu) {
    final classes = [
      BitwiseClassBinding(),
      StreamSubscriptionClassBinding(),
      StreamClassBinding(),
      StreamControllerClassBinding(),
      HttpBaseOptionsClassBinding(),
      RequestOptionsClassBinding(),
      HttpResponseClassBinding(),
      HttpClientClassBinding(),
      DurationClassBinding(),
      TimerClassBinding(),
      DateTimeClassBinding(),
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

  /// Loads the bytecode for the standard library from the Flutter asset bundle.
  /// Add following to your `pubspec.yaml`:
  /// 
  /// ```yaml
  /// flutter:
  ///   assets:
  ///     - packages/hetu_std/assets/bytecode/std.out
  /// ```
  static Future<void> loadBytecodeFlutter(Hetu hetu) async {
    final byteCodeFile = await rootBundle.load(
      'packages/hetu_std/assets/bytecode/std.out',
    );
    final byteCode = byteCodeFile.buffer.asUint8List();

    hetu.loadBytecode(bytes: byteCode, moduleName: 'std');
  }
}
