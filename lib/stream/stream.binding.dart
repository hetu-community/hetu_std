import 'package:hetu_script/binding.dart';
import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_script/values.dart';
import 'package:hetu_std/stream/stream.dart';

extension StreamBinding on Stream {
  dynamic hFetch(String varName) {
    return switch (varName) {
      "isBroadcast" => isBroadcast,
      "isEmpty" => isEmpty,
      "length" => length,
      "first" => first,
      "last" => last,
      "single" => single,
      // "asBroadcastStream" => (
      //   HTEntity entity, {
      //   positionalArgs,
      //   namedArgs,
      //   typedArgs,
      // }) {
      //   HTFunction? onListen = namedArgs['onListen'];
      //   HTFunction? onCancel = namedArgs['onCancel'];

      //   return asBroadcastStream(
      //     onListen:
      //         onListen != null
      //             ? (subscription) =>
      //                 onListen.call(positionalArgs: [subscription])
      //             : null,
      //     onCancel:
      //         onCancel != null
      //             ? (subscription) =>
      //                 onCancel.call(positionalArgs: [subscription])
      //             : null,
      //   );
      // },
      "listen" => (
        HTEntity entity, {
        List<dynamic> positionalArgs = const [],
        Map<String, dynamic> namedArgs = const {},
        List<HTType> typeArgs = const [],
      }) {
        HTFunction onData = positionalArgs[0];
        HTFunction? onError = namedArgs['onError'];
        HTFunction? onDone = namedArgs['onDone'];
        bool? cancelOnError = namedArgs['cancelOnError'];

        return listen(
          (data) => onData.call(positionalArgs: [data]),
          onError:
              onError != null
                  ? (error, stackTrace) =>
                      onError.call(positionalArgs: [error, stackTrace])
                  : null,
          onDone: onDone != null ? () => onDone.call() : null,
          cancelOnError: cancelOnError ?? false,
        );
      },
      "drain" => (
        HTEntity entity, {
        List<dynamic> positionalArgs = const [],
        Map<String, dynamic> namedArgs = const {},
        List<HTType> typeArgs = const [],
      }) {
        dynamic futureValue = namedArgs['futureValue'];
        return drain(futureValue);
      },
      "where" => (
        HTEntity entity, {
        List<dynamic> positionalArgs = const [],
        Map<String, dynamic> namedArgs = const {},
        List<HTType> typeArgs = const [],
      }) {
        HTFunction test = positionalArgs[0];
        return where((element) => test.call(positionalArgs: [element]));
      },
      "map" => (
        HTEntity entity, {
        List<dynamic> positionalArgs = const [],
        Map<String, dynamic> namedArgs = const {},
        List<HTType> typeArgs = const [],
      }) {
        HTFunction convert = positionalArgs[0];
        return map((element) => convert.call(positionalArgs: [element]));
      },
      "expand" => (
        HTEntity entity, {
        List<dynamic> positionalArgs = const [],
        Map<String, dynamic> namedArgs = const {},
        List<HTType> typeArgs = const [],
      }) {
        HTFunction convert = positionalArgs[0];
        return expand((element) => convert.call(positionalArgs: [element]));
      },
      "reduce" => (
        HTEntity entity, {
        List<dynamic> positionalArgs = const [],
        Map<String, dynamic> namedArgs = const {},
        List<HTType> typeArgs = const [],
      }) {
        HTFunction combine = positionalArgs[0];
        return reduce(
          (value, element) => combine.call(positionalArgs: [value, element]),
        );
      },
      "fold" => (
        HTEntity entity, {
        List<dynamic> positionalArgs = const [],
        Map<String, dynamic> namedArgs = const {},
        List<HTType> typeArgs = const [],
      }) {
        dynamic initialValue = positionalArgs[0];
        HTFunction combine = positionalArgs[1];
        return fold(
          initialValue,
          (previousValue, element) =>
              combine.call(positionalArgs: [previousValue, element]),
        );
      },
      "join" => (
        HTEntity entity, {
        List<dynamic> positionalArgs = const [],
        Map<String, dynamic> namedArgs = const {},
        List<HTType> typeArgs = const [],
      }) {
        String separator = positionalArgs[0];
        return join(separator);
      },
      "toList" =>
        (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) => toList(),
      "toSet" =>
        (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) => toSet(),
      // "take" => (
      //   HTEntity entity, {
      //   List<dynamic> positionalArgs = const [],
      //   Map<String, dynamic> namedArgs = const {},
      //   List<HTType> typeArgs = const [],
      // }) {
      //   int count = positionalArgs[0];
      //   return take(count);
      // },
      // "takeWhile" => (
      //   HTEntity entity, {
      //   List<dynamic> positionalArgs = const [],
      //   Map<String, dynamic> namedArgs = const {},
      //   List<HTType> typeArgs = const [],
      // }) {
      //   HTFunction test = positionalArgs[0];
      //   return takeWhile((element) => test.call(positionalArgs: [element]));
      // },
      // "skip" => (
      //   HTEntity entity, {
      //   List<dynamic> positionalArgs = const [],
      //   Map<String, dynamic> namedArgs = const {},
      //   List<HTType> typeArgs = const [],
      // }) {
      //   int count = positionalArgs[0];
      //   return skip(count);
      // },
      // "skipWhile" => (
      //   HTEntity entity, {
      //   List<dynamic> positionalArgs = const [],
      //   Map<String, dynamic> namedArgs = const {},
      //   List<HTType> typeArgs = const [],
      // }) {
      //   HTFunction test = positionalArgs[0];
      //   return skipWhile((element) => test.call(positionalArgs: [element]));
      // },
      // "distinct" => (
      //   HTEntity entity, {
      //   List<dynamic> positionalArgs = const [],
      //   Map<String, dynamic> namedArgs = const {},
      //   List<HTType> typeArgs = const [],
      // }) {
      //   return distinct();
      // },
      _ => throw HTError.undefined(varName),
    };
  }
}

class StreamClassBinding extends HTExternalClass {
  StreamClassBinding() : super('Stream');

  @override
  dynamic memberGet(String varName, {String? from}) {
    return switch (varName) {
      "Stream.empty" =>
        (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) => Stream.empty(),
      "Stream.fromIterable" =>
        (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) => Stream.fromIterable(positionalArgs[0]),
      _ => throw HTError.undefined(varName),
    };
  }

  @override
  instanceMemberGet(object, String varName) {
    return (object as Stream).hFetch(varName);
  }
}
