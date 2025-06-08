import 'package:hetu_script/binding.dart';
import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_std/regexp/match.dart';
import 'package:hetu_std/regexp/regex.dart';

extension ExpressionMatchBinding on ExpressionMatch {
  dynamic htFetch(String varName) {
    return switch (varName) {
      "start" => start,
      "end" => end,
      "group" =>
        (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) => group(positionalArgs[0]),
      "groupCount" => groupCount,
      "input" => input,
      "namedGroup" =>
        (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) => namedGroup(positionalArgs[0]),
      _ => throw HTError.undefined(varName),
    };
  }
}

class ExpressionMatchClassBinding extends HTExternalClass {
  ExpressionMatchClassBinding() : super("ExpressionMatch");

  @override
  memberGet(String varName, {String? from}) {
    return switch (varName) {
      _ => throw HTError.undefined(varName),
    };
  }

  @override
  instanceMemberGet(object, String varName) {
    return (object as ExpressionMatch).htFetch(varName);
  }

  @override
  instanceSubGet(object, key) {
    return (object as ExpressionMatch)[key];
  }
}

extension SimpleMatchBinding on SimpleMatch {
  dynamic htFetch(String varName) {
    return switch (varName) {
      "start" => start,
      "end" => end,
      "group" =>
        (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) => group(positionalArgs[0]),
      "groups" =>
        (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) => groups(positionalArgs[0]),
      "input" => input,
      _ => throw HTError.undefined(varName),
    };
  }
}

class SimpleMatchClassBinding extends HTExternalClass {
  SimpleMatchClassBinding() : super("SimpleMatch");

  @override
  memberGet(String varName, {String? from}) {
    return switch (varName) {
      _ => throw HTError.undefined(varName),
    };
  }

  @override
  instanceMemberGet(object, String varName) {
    return (object as SimpleMatch).htFetch(varName);
  }

  @override
  instanceSubGet(object, key) {
    return (object as SimpleMatch)[key];
  }
}

extension RegexBinding on Regex {
  dynamic htFetch(String varName) {
    return switch (varName) {
      "isCaseSensitive" => isCaseSensitive,
      "isMultiLine" => isMultiLine,
      "isUnicode" => isUnicode,
      "isDotAll" => isDotAll,
      "pattern" => pattern,
      "hasMatch" =>
        (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) => hasMatch(positionalArgs[0]),
      "firstMatch" => (
        HTEntity entity, {
        List<dynamic> positionalArgs = const [],
        Map<String, dynamic> namedArgs = const {},
        List<HTType> typeArgs = const [],
      }) {
        final match = firstMatch(positionalArgs[0]);
        if (match == null) {
          return null;
        }
        return ExpressionMatch(match);
      },
      "allMatches" =>
        (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) =>
            allMatches(
              positionalArgs[0],
              positionalArgs.length > 1 ? positionalArgs[1] : 0,
            ).map((match) => ExpressionMatch(match)).toList(),
      "matchAsPrefix" => (
        HTEntity entity, {
        List<dynamic> positionalArgs = const [],
        Map<String, dynamic> namedArgs = const {},
        List<HTType> typeArgs = const [],
      }) {
        final match = matchAsPrefix(
          positionalArgs[0],
          positionalArgs.length > 1 ? positionalArgs[1] : 0,
        );
        if (match == null) {
          return null;
        }
        return SimpleMatch(match);
      },
      "stringMatch" =>
        (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) => stringMatch(positionalArgs[0]),
      _ => throw HTError.undefined(varName),
    };
  }
}

class RegexClassBinding extends HTExternalClass {
  RegexClassBinding() : super("Regex");

  @override
  memberGet(String varName, {String? from}) {
    return switch (varName) {
      "Regex" => (
        HTEntity entity, {
        List<dynamic> positionalArgs = const [],
        Map<String, dynamic> namedArgs = const {},
        List<HTType> typeArgs = const [],
      }) {
        final pattern = positionalArgs[0];
        return Regex(
          pattern,
          caseSensitive: namedArgs["caseSensitive"] ?? true,
          multiLine: namedArgs["multiLine"] ?? false,
          unicode: namedArgs["unicode"] ?? false,
          dotAll: namedArgs["dotAll"] ?? false,
        );
      },
      "Regex.escape" =>
        (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) => Regex.escape(positionalArgs[0]),
      _ => throw HTError.undefined(varName),
    };
  }

  @override
  instanceMemberGet(object, String varName) {
    return (object as Regex).htFetch(varName);
  }
}
