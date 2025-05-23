import 'dart:async';

import 'package:hetu_script/external/external_class.dart';
import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_script/values.dart';

extension TimerBinding on Timer {
  dynamic htFetch(String varName) {
    switch (varName) {
      case 'cancel':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            cancel();
      case 'isActive':
        return isActive;
      case 'tick':
        return tick;
      default:
        throw HTError.undefined(varName);
    }
  }
}

class TimerClassBinding extends HTExternalClass {
  TimerClassBinding() : super('Timer');

  @override
  dynamic memberGet(String varName, {String? from}) {
    switch (varName) {
      case 'Timer':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            Timer(
              positionalArgs[0],
              () => (positionalArgs[1] as HTFunction).call(),
            );
      case 'Timer.periodic':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            Timer.periodic(
              positionalArgs[0],
              (timer) => (positionalArgs[1] as HTFunction).call(
                positionalArgs: [timer.cancel],
              ),
            );
      default:
        throw HTError.undefined(varName);
    }
  }

  @override
  dynamic instanceMemberGet(dynamic object, String varName) {
    return (object as Timer).htFetch(varName);
  }
}
