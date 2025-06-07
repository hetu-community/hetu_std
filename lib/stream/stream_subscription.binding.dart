import 'package:hetu_script/binding.dart';
import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_std/stream/stream_subscription.dart';

extension StreamSubscriptionBinding on StreamSubscription {
  dynamic hFetch(String varName) {
    return switch (varName) {
      "asFuture" => (
        HTEntity entity, {
        List<dynamic> positionalArgs = const [],
        Map<String, dynamic> namedArgs = const {},
        List<HTType> typeArgs = const [],
      }) {
        return asFuture(positionalArgs[0]);
      },
      "cancel" => (
        HTEntity entity, {
        List<dynamic> positionalArgs = const [],
        Map<String, dynamic> namedArgs = const {},
        List<HTType> typeArgs = const [],
      }) {
        return cancel();
      },
      "pause" => (
        HTEntity entity, {
        List? positionalArgs,
        namedArgs,
        typedArgs,
      }) {
        return pause(positionalArgs?.elementAtOrNull(0));
      },
      "resume" => (
        HTEntity entity, {
        List<dynamic> positionalArgs = const [],
        Map<String, dynamic> namedArgs = const {},
        List<HTType> typeArgs = const [],
      }) {
        return resume();
      },
      "isPaused" => isPaused,
      _ => throw HTError.undefined(varName),
    };
  }
}

class StreamSubscriptionClassBinding extends HTExternalClass {
  StreamSubscriptionClassBinding() : super('StreamSubscription');

  @override
  dynamic memberGet(String varName, {String? from}) {
    return switch (varName) {
      // Abstract class, no constructor
      _ => throw HTError.undefined(varName),
    };
  }

  @override
  instanceMemberGet(object, String varName) {
    return (object as StreamSubscription).hFetch(varName);
  }
}
