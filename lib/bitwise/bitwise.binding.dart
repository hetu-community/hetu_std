import 'package:hetu_script/external/external_class.dart';
import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_std/bitwise/bitwise.dart';

class BitwiseClassBinding extends HTExternalClass {
  BitwiseClassBinding() : super('Bitwise');

  @override
  dynamic memberGet(String varName, {String? from}) {
    return switch (varName) {
      'Bitwise.and' =>
        (
          HTEntity entity, {
          List<dynamic>? positionalArgs,
          Map<String, dynamic>? namedArgs,
          typeArgs, 
        }) => Bitwise.and(positionalArgs?.cast<int>() as List<int>),
      'Bitwise.or' =>
        (
          HTEntity entity, {
          List<dynamic>? positionalArgs,
          Map<String, dynamic>? namedArgs,
          typeArgs,
        }) => Bitwise.or(positionalArgs?.cast<int>() as List<int>),
      'Bitwise.xor' =>
        (
          HTEntity entity, {
          List<dynamic>? positionalArgs,
          Map<String, dynamic>? namedArgs,
          typeArgs,
        }) => Bitwise.xor(positionalArgs?.cast<int>() as List<int>),
      'Bitwise.not' =>
        (
          HTEntity entity, {
          List<dynamic>? positionalArgs,
          Map<String, dynamic>? namedArgs,
          typeArgs,
        }) => Bitwise.not(positionalArgs?[0] as int),
      'Bitwise.leftShift' =>
        (
          HTEntity entity, {
          List<dynamic>? positionalArgs,
          Map<String, dynamic>? namedArgs,
          typeArgs,
        }) => Bitwise.leftShift(positionalArgs?.cast<int>() as List<int>),
      'Bitwise.rightShift' =>
        (
          HTEntity entity, {
          List<dynamic>? positionalArgs,
          Map<String, dynamic>? namedArgs,
          typeArgs,
        }) => Bitwise.rightShift(positionalArgs?.cast<int>() as List<int>),
      'Bitwise.unsignedRightShift' =>
        (
          HTEntity entity, {
          List<dynamic>? positionalArgs,
          Map<String, dynamic>? namedArgs,
          typeArgs,
        }) => Bitwise.unsignedRightShift(
          positionalArgs?.cast<int>() as List<int>,
        ),
      _ => throw HTError.undefined(varName),
    };
  }
}
