import 'package:flutter/material.dart';
import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_std/hetu_std.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final hetu = Hetu();
  hetu.init();
  HetuStdLoader.loadBindings(hetu);
  await HetuStdLoader.loadBytecodeFlutter(hetu);

  hetu.eval(r"""
    import 'module:std' as std

    var { Base32, utf8, Crypto, Timer, Duration, HttpClient, 
      HttpResponse, RequestOptions, Bitwise, DateTime,
      StreamController, Stream, StreamSubscription, JSON, Regex, delayed } = std
    
    delayed(Duration(seconds: 2), () {
      print("Delayed execution after 2 seconds")
    }).then(() {
      print("This will run after the delay")
    })

    var regex = Regex('(\\w+)\\s+(\\w+)')
    var match = regex.matchAsPrefix("Hello World")
    print("Match: ${match}")
    print("Start: ${match.start}, End: ${match.end}")
    print("Group 0: ${match.group(0)}")

    var strJson = '{"hello": "world", "foo": "bar"}'
    var jsonData = JSON.decode(strJson)
    print("JSON Data: ${jsonData}")
    var jsonString = JSON.encode(jsonData)
    print("JSON String: ${jsonString}")
    
    var controller = StreamController()
    print("Controller: ${controller}")
    var stream = controller.stream
    print("Stream: ${stream}")
    var subscription = stream.listen((data) {
      print("Received: ${data}")
    })
    controller.add("Hello, Hetu!")
    controller.add("This is a stream example.")
    controller.close()

    var or = Bitwise.or(1, 2)
    print("Bitwise OR: ${or}")

    var currentTime = DateTime.now()
    print("Current Time: ${currentTime}")
    var yesterday = currentTime.subtract(Duration(days: 1))
    print("Yesterday: ${yesterday}")
    var tomorrow = currentTime.add(Duration(days: 1))
    print("Tomorrow: ${tomorrow}")

    var count = 0

    var timer = Timer.periodic(Duration(seconds: 1), (cancel) {
      print("Hello, World! ${count}")
      count += 1
      if (count == 5) {
        cancel()
      }
    })

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

    var httpClient = HttpClient()

    httpClient.get_req(
      "https://www.google.com",
      options: RequestOptions(
        validateStatus: (status) {
          print("Status: ${status}")
          return status == 200
        },
      )
    ).then((response) {
      print("Response length: ${response.data.length}")
    })
  """);

  runApp(
    MaterialApp(
      home: Center(
        child: Text('Hetu Script Example', style: TextStyle(fontSize: 24)),
      ),
    ),
  );
}
