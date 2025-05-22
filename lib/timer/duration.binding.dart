import 'package:hetu_script/binding.dart';
import 'package:hetu_script/hetu_script.dart';

extension DurationBinding on Duration {
  dynamic htFetch(String varName) {
    switch (varName) {
      case 'inDays':
        return inDays;
      case 'inHours':
        return inHours;
      case 'inMinutes':
        return inMinutes;
      case 'inSeconds':
        return inSeconds;
      case 'inMilliseconds':
        return inMilliseconds;
      case 'inMicroseconds':
        return inMicroseconds;
      case 'isNegative':
        return isNegative;
      default:
        throw HTError.undefined(varName);
    }
  }
}

class DurationClassBinding extends HTExternalClass {
  DurationClassBinding() : super('Duration');

  @override
  dynamic memberGet(String varName, {String? from}) {
    switch (varName) {
      case 'Duration':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            Duration(
              days: namedArgs['days'] ?? 0,
              hours: namedArgs['hours'] ?? 0,
              minutes: namedArgs['minutes'] ?? 0,
              seconds: namedArgs['seconds'] ?? 0,
              milliseconds: namedArgs['milliseconds'] ?? 0,
              microseconds: namedArgs['microseconds'] ?? 0,
            );
      default:
        throw HTError.undefined(varName);
    }
  }

  @override
  dynamic instanceMemberGet(dynamic object, String varName) {
    return (object as Duration).htFetch(varName);
  }
}
