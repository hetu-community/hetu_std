import 'package:hetu_script/binding.dart';
import 'package:hetu_script/hetu_script.dart';

extension DateTimeBinding on DateTime {
  dynamic htFetch(String id) => switch (id) {
    'year' => year,
    'month' => month,
    'weekday' => weekday,
    'day' => day,
    'hour' => hour,
    'minute' => minute,
    'second' => second,
    'microsecond' => microsecond,
    'microsecondsSinceEpoch' => microsecondsSinceEpoch,
    'millisecond' => millisecond,
    'millisecondsSinceEpoch' => millisecondsSinceEpoch,
    'isUtc' => isUtc,
    'timeZoneName' => timeZoneName,
    'timeZoneOffset' => timeZoneOffset,
    'add' =>
      (HTEntity entity, {List? positionalArgs, Map? namedArgs, typeArgs}) =>
          add(positionalArgs?[0] as Duration),
    'subtract' =>
      (HTEntity entity, {List? positionalArgs, Map? namedArgs, typeArgs}) =>
          subtract(positionalArgs?[0] as Duration),
    'compareTo' =>
      (HTEntity entity, {List? positionalArgs, Map? namedArgs, typeArgs}) =>
          compareTo(positionalArgs?[0] as DateTime),
    'difference' =>
      (HTEntity entity, {List? positionalArgs, Map? namedArgs, typeArgs}) =>
          difference(positionalArgs?[0] as DateTime),
    'isAfter' =>
      (HTEntity entity, {List? positionalArgs, Map? namedArgs, typeArgs}) =>
          isAfter(positionalArgs?[0] as DateTime),
    'isBefore' =>
      (HTEntity entity, {List? positionalArgs, Map? namedArgs, typeArgs}) =>
          isBefore(positionalArgs?[0] as DateTime),
    'isAtSameMomentAs' =>
      (HTEntity entity, {List? positionalArgs, Map? namedArgs, typeArgs}) =>
          isAtSameMomentAs(positionalArgs?[0] as DateTime),
    'toLocal' =>
      (HTEntity entity, {List? positionalArgs, Map? namedArgs, typeArgs}) =>
          toLocal(),
    'toUtc' =>
      (HTEntity entity, {List? positionalArgs, Map? namedArgs, typeArgs}) =>
          toUtc(),
    'toIso8601String' =>
      (HTEntity entity, {List? positionalArgs, Map? namedArgs, typeArgs}) =>
          toIso8601String(),
    'toString' =>
      (HTEntity entity, {List? positionalArgs, Map? namedArgs, typeArgs}) =>
          toString(),
    _ => throw HTError.undefined(id),
  };
}

class DateTimeClassBinding extends HTExternalClass {
  DateTimeClassBinding() : super('DateTime');

  @override
  dynamic memberGet(String varName, {String? from}) => switch (varName) {
    'DateTime' =>
      (HTEntity entity, {List? positionalArgs, Map? namedArgs, typeArgs}) =>
          DateTime(
            positionalArgs?[0] as int,
            positionalArgs?[1] as int,
            positionalArgs?[2] as int,
            positionalArgs?[3] as int,
            positionalArgs?[4] as int,
            positionalArgs?[5] as int,
            positionalArgs?[6] as int,
            positionalArgs?[7] as int,
          ),
    'DateTime.now' =>
      (HTEntity entity, {List? positionalArgs, Map? namedArgs, typeArgs}) =>
          DateTime.now(),
    'DateTime.fromMillisecondsSinceEpoch' =>
      (HTEntity entity, {List? positionalArgs, Map? namedArgs, typeArgs}) =>
          DateTime.fromMillisecondsSinceEpoch(
            positionalArgs?[0] as int,
            isUtc: namedArgs?['isUtc'] ?? false,
          ),
    'DateTime.fromMicrosecondsSinceEpoch' =>
      (HTEntity entity, {List? positionalArgs, Map? namedArgs, typeArgs}) =>
          DateTime.fromMicrosecondsSinceEpoch(
            positionalArgs?[0] as int,
            isUtc: namedArgs?['isUtc'] ?? false,
          ),
    'DateTime.utc' =>
      (HTEntity entity, {List? positionalArgs, Map? namedArgs, typeArgs}) =>
          DateTime.utc(
            positionalArgs?[0] as int,
            positionalArgs?[1] as int,
            positionalArgs?[2] as int,
            positionalArgs?[3] as int,
            positionalArgs?[4] as int,
            positionalArgs?[5] as int,
            positionalArgs?[6] as int,
          ),
    'DateTime.parse' =>
      (HTEntity entity, {List? positionalArgs, Map? namedArgs, typeArgs}) =>
          DateTime.parse(positionalArgs?[0] as String),
    _ => throw HTError.undefined(varName),
  };

  @override
  void instanceMemberGet(dynamic object, String varName) =>
      (object as DateTime).htFetch(varName);
}
