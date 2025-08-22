import 'package:hetu_script/binding.dart';
import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_script/values.dart';

class FutureUtils extends HTExternalClass {
  FutureUtils() : super('FutureUtils');

  /// Executes the futures in queue, one after another. And returns their results
  Future<List> execute(List<Future> futures, {Duration? delay}) async {
    final results = [];
    for (var future in futures) {
      if (delay != null && futures.first != future) {
        final result = await Future.delayed(delay, () => future);
        results.add(result);
      } else {
        final result = await future;
        results.add(result);
      }
    }
    return results;
  }

  @override
  memberGet(String varName, {String? from}) {
    switch (varName) {
      case "FutureUtils.delayed":
        return (
          HTEntity entity, {
          List? positionalArgs,
          Map? namedArgs,
          typeArgs,
        }) {
          final duration = positionalArgs?[0] as Duration;
          final callback = positionalArgs?[1] as HTFunction?;
          return Future.delayed(
            duration,
            callback != null ? () => callback.call() : null,
          );
        };
      case "FutureUtils.execute":
        return (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) => execute(
          (positionalArgs[0] as List).cast<Future>(),
          delay: namedArgs['delay'],
        );
      default:
        throw HTError.undefined(varName);
    }
  }
}
