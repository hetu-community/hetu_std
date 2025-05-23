## Hetu std

A standard library for hetu_script.

Includes following modules (Dart binding):

- Duration
- Timer
- HttpClient
- base32
- utf8
- Crypto

### Installation

Just add the dependency using pub get:

```
$ flutter pub add hetu_std hetu_script
```

### Usage

To load the bindings we provide a `loadHetuStd` function. You've to manually import the bytecode and add it by yourself through `dart:io`

```dart
import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_std/hetu_std.dart';

void main() async {
  final hetu = Hetu();
  hetu.init();
  HetuStdLoader.loadBindings(hetu);
  await HetuStdLoader.loadBytecodePureDart(
    hetu,
    "~/.pub-cache/hosted/pub.dev/hetu_std-0.1.0",
  );

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
```

For Flutter usage:

First add the package assets in your `pubspec.yaml`

```yaml
flutter:
  assets:
    - packages/hetu_std/assets/bytecode/std.out
```

Then you can just load it using the helper method that we provide:
```dart
import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_std/hetu_std.dart';

void main() async {
  final hetu = Hetu();
  hetu.init();
  HetuStdLoader.loadBindings(hetu);
  await HetuStdLoader.loadBytecodeFlutter(hetu);

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
```