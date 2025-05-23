import 'package:hetu_script/external/external_class.dart';
import 'package:hetu_script/hetu_script.dart';
import 'package:hetu_script/values.dart';
import 'package:hetu_std/http/http.dart';

extension HttpBaseOptionsBinding on HttpBaseOptions {
  dynamic htFetch(String id) {
    switch (id) {
      case 'baseUrl':
        return baseUrl;
      case 'connectTimeout':
        return connectTimeout;
      case 'receiveTimeout':
        return receiveTimeout;
      case 'sendTimeout':
        return sendTimeout;
      case 'followRedirects':
        return followRedirects;
      case 'validateStatus':
        return validateStatus;
      default:
        throw HTError.undefined(id);
    }
  }
}

class HttpBaseOptionsClassBinding extends HTExternalClass {
  HttpBaseOptionsClassBinding() : super('HttpBaseOptions');

  @override
  dynamic memberGet(String varName, {String? from}) {
    switch (varName) {
      case 'HttpBaseOptions':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) {
          HTFunction? validateStatus = namedArgs['validateStatus'];
          return HttpBaseOptions(
            baseUrl: namedArgs['baseUrl'],
            connectTimeout: namedArgs['connectTimeout'],
            receiveTimeout: namedArgs['receiveTimeout'],
            sendTimeout: namedArgs['sendTimeout'],
            followRedirects: namedArgs['followRedirects'],
            validateStatus:
                validateStatus == null
                    ? null
                    : (status) =>
                        validateStatus.call(positionalArgs: [status]) as bool,
          );
        };
      default:
        throw HTError.undefined(varName);
    }
  }

  @override
  dynamic instanceMemberGet(dynamic object, String varName) {
    var i = object as HttpBaseOptions;
    return i.htFetch(varName);
  }
}

extension RequestOptionsBinding on RequestOptions {
  dynamic htFetch(String id) {
    switch (id) {
      case 'method':
        return method;
      case 'headers':
        return headers;
      case 'extra':
        return extra;
      case 'responseType':
        return responseType;
      case 'followRedirects':
        return followRedirects;
      case 'maxRedirects':
        return maxRedirects;
      case 'validateStatus':
        return validateStatus;
      default:
        throw HTError.undefined(id);
    }
  }
}

class RequestOptionsClassBinding extends HTExternalClass {
  RequestOptionsClassBinding() : super('RequestOptions');

  @override
  dynamic memberGet(String varName, {String? from}) {
    switch (varName) {
      case 'RequestOptions':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) {
          HTFunction? validateStatus = namedArgs['validateStatus'];
          return RequestOptions(
            method: namedArgs['method'],
            headers: namedArgs['headers'],
            extra: namedArgs['extra'],
            responseType: namedArgs['responseType'],
            followRedirects: namedArgs['followRedirects'],
            maxRedirects: namedArgs['maxRedirects'],
            validateStatus:
                validateStatus == null
                    ? null
                    : (status) =>
                        validateStatus.call(positionalArgs: [status]) as bool,
          );
        };
      default:
        throw HTError.undefined(varName);
    }
  }

  @override
  dynamic instanceMemberGet(dynamic object, String varName) {
    var i = object as RequestOptions;
    return i.htFetch(varName);
  }
}

extension HttpResponseBinding on HttpResponse {
  dynamic htFetch(String id) {
    switch (id) {
      case 'statusCode':
        return statusCode;
      case 'statusMessage':
        return statusMessage;
      case 'data':
        return data;
      case 'headers':
        return headers;
      case 'isRedirect':
        return isRedirect;
      default:
        throw HTError.undefined(id);
    }
  }
}

class HttpResponseClassBinding extends HTExternalClass {
  HttpResponseClassBinding() : super('HttpResponse');

  @override
  dynamic memberGet(String varName, {String? from}) {
    switch (varName) {
      case 'HttpResponse':
        return ({positionalArgs, namedArgs, typeArgs}) => HttpResponse(
          statusCode: namedArgs['statusCode'],
          statusMessage: namedArgs['statusMessage'],
          data: namedArgs['data'],
          headers: namedArgs['headers'],
          isRedirect: namedArgs['isRedirect'],
        );
      default:
        throw HTError.undefined(varName);
    }
  }

  @override
  dynamic instanceMemberGet(dynamic object, String varName) {
    var i = object as HttpResponse;
    return i.htFetch(varName);
  }
}

extension HttpClientBinding on HttpClient {
  dynamic htFetch(String id) {
    return switch (id) {
      "request" =>
        (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) => request(
          path: namedArgs['path'],
          data: namedArgs['data'],
          options: namedArgs['options'],
          queryParameters: namedArgs['queryParameters'],
        ),
      "head" =>
        (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) => head(
          positionalArgs[0],
          options: namedArgs['options'],
          queryParameters: namedArgs['queryParameters'],
        ),
      "get_req" =>
        (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) => get(
          positionalArgs[0],
          options: namedArgs['options'],
          queryParameters: namedArgs['queryParameters'],
        ),
      "post" =>
        (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) => post(
          positionalArgs[0],
          data: namedArgs['data'],
          options: namedArgs['options'],
          queryParameters: namedArgs['queryParameters'],
        ),
      "put" =>
        (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) => put(
          positionalArgs[0],
          data: namedArgs['data'],
          options: namedArgs['options'],
          queryParameters: namedArgs['queryParameters'],
        ),
      "patch" =>
        (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) => patch(
          positionalArgs[0],
          data: namedArgs['data'],
          options: namedArgs['options'],
          queryParameters: namedArgs['queryParameters'],
        ),
      "delete_req" =>
        (
          HTEntity entity, {
          List<dynamic> positionalArgs = const [],
          Map<String, dynamic> namedArgs = const {},
          List<HTType> typeArgs = const [],
        }) => delete(
          positionalArgs[0],
          data: namedArgs['data'],
          options: namedArgs['options'],
          queryParameters: namedArgs['queryParameters'],
        ),
      _ => throw HTError.undefined(id),
    };
  }
}

class HttpClientClassBinding extends HTExternalClass {
  HttpClientClassBinding() : super('HttpClient');

  @override
  dynamic memberGet(String varName, {String? from}) {
    switch (varName) {
      case 'HttpClient':
        return (HTEntity entity, {positionalArgs, namedArgs, typeArgs}) =>
            HttpClient(positionalArgs[0]);
      default:
        throw HTError.undefined(varName);
    }
  }

  @override
  dynamic instanceMemberGet(dynamic object, String varName) {
    var i = object as HttpClient;
    return i.htFetch(varName);
  }
}
