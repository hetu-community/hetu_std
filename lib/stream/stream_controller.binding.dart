import 'package:hetu_script/binding.dart';
import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_script/values.dart';
import 'package:hetu_std/stream/stream_controller.dart';
import 'package:hetu_std/stream/stream.dart';

extension StreamControllerBinding on StreamController {
  dynamic htFetch(String varName) {
    return switch (varName) {
      "done" => done,
      "isClosed" => isClosed,
      "isPaused" => isPaused,
      "hasListener" => hasListener,
      "stream" => Stream(stream),
      "add" =>
        (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) => add(positionalArgs[0]),
      "addError" =>
        (HTEntity entity, {List? positionalArgs, namedArgs, typedArgs}) =>
            addError(positionalArgs?[0], positionalArgs?.elementAtOrNull(0)),
      "close" =>
        (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) => close(),
      _ => throw HTError.undefined(varName),
    };
  }
}

class StreamControllerClassBinding extends HTExternalClass {
  StreamControllerClassBinding() : super('StreamController');

  @override
  memberGet(String varName, {String? from}) {
    switch (varName) {
      case "StreamController":
        return (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) {
          HTFunction? onListen = namedArgs['onListen'];
          HTFunction? onPause = namedArgs['onPause'];
          HTFunction? onResume = namedArgs['onResume'];
          HTFunction? onCancel = namedArgs['onCancel'];

          return StreamController(
            sync: namedArgs['sync'] ?? false,
            onListen: onListen != null ? () => onListen.call() : null,
            onPause: onPause != null ? () => onPause.call() : null,
            onResume: onResume != null ? () => onResume.call() : null,
            onCancel: onCancel != null ? () => onCancel.call() : null,
          );
        };
      case "StreamController.broadcast":
        return (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) {
          HTFunction? onListen = namedArgs['onListen'];
          HTFunction? onCancel = namedArgs['onCancel'];

          return StreamController.broadcast(
            sync: namedArgs['sync'] ?? false,
            onListen: onListen != null ? () => onListen.call() : null,
            onCancel: onCancel != null ? () => onCancel.call() : null,
          );
        };
      default:
        throw HTError.undefined(varName);
    }
  }

  @override
  dynamic instanceMemberGet(dynamic object, String varName) {
    var i = object as StreamController;
    return i.htFetch(varName);
  }
}
