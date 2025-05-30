import 'package:dio/dio.dart';

enum HttpResponseType { json, stream, plain, bytes }

class HttpBaseOptions {
  final String? baseUrl;
  final int? connectTimeout;
  final int? receiveTimeout;
  final int? sendTimeout;
  final bool? followRedirects;
  final ValidateStatus? validateStatus;
  final Map<String, dynamic>? headers;
  final Map<String, dynamic>? queryParameters;

  const HttpBaseOptions({
    this.baseUrl,
    this.connectTimeout,
    this.receiveTimeout,
    this.sendTimeout,
    this.followRedirects,
    this.validateStatus,
    this.headers,
    this.queryParameters,
  });
}

class RequestOptions {
  final String? method;
  final Map<String, dynamic>? headers;
  final Map<String, dynamic>? extra;
  final HttpResponseType? responseType;
  final bool? followRedirects;
  final int? maxRedirects;
  final ValidateStatus? validateStatus;

  const RequestOptions({
    this.method,
    this.headers,
    this.extra,
    this.responseType,
    this.followRedirects,
    this.maxRedirects,
    this.validateStatus,
  });

  RequestOptions copyWith({
    String? method,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    HttpResponseType? responseType,
    bool? followRedirects,
    int? maxRedirects,
    ValidateStatus? validateStatus,
  }) {
    return RequestOptions(
      method: method ?? this.method,
      headers: headers ?? this.headers,
      extra: extra ?? this.extra,
      responseType: responseType ?? this.responseType,
      followRedirects: followRedirects ?? this.followRedirects,
      maxRedirects: maxRedirects ?? this.maxRedirects,
      validateStatus: validateStatus ?? this.validateStatus,
    );
  }
}

Options optionsWrapperToDioOptions(RequestOptions options) {
  return Options(
    method: options.method,
    headers: options.headers,
    extra: options.extra,
    responseType: switch (options.responseType) {
      HttpResponseType.json => ResponseType.json,
      HttpResponseType.stream => ResponseType.stream,
      HttpResponseType.plain => ResponseType.plain,
      HttpResponseType.bytes => ResponseType.bytes,
      _ => null,
    },
    followRedirects: options.followRedirects,
    maxRedirects: options.maxRedirects,
    validateStatus: options.validateStatus,
  );
}

class HttpResponse {
  final int statusCode;
  final String statusMessage;
  final dynamic data;
  final Map<String, dynamic> headers;
  final bool isRedirect;

  const HttpResponse({
    required this.statusCode,
    required this.statusMessage,
    required this.data,
    required this.headers,
    required this.isRedirect,
  });
}

HttpResponse dioResponseToResponseWrapper(Response response) {
  return HttpResponse(
    statusCode: response.statusCode ?? 0,
    statusMessage: response.statusMessage ?? "",
    data: response.data,
    headers: response.headers.map,
    isRedirect: response.isRedirect,
  );
}

class HttpClient {
  late final Dio _dio;

  HttpClient([HttpBaseOptions? options]) {
    _dio = Dio(
      options != null
          ? BaseOptions(
            baseUrl: options.baseUrl ?? "",
            connectTimeout:
                options.connectTimeout != null
                    ? Duration(seconds: options.connectTimeout!)
                    : null,
            receiveTimeout:
                options.receiveTimeout != null
                    ? Duration(seconds: options.receiveTimeout!)
                    : null,
            sendTimeout:
                options.sendTimeout != null
                    ? Duration(seconds: options.sendTimeout!)
                    : null,
            followRedirects: options.followRedirects,
            validateStatus: options.validateStatus,
            headers: options.headers,
            queryParameters: options.queryParameters,
          )
          : null,
    );
  }

  Future<HttpResponse> request({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    RequestOptions? options,
  }) async {
    final res = await _dio.request(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options != null ? optionsWrapperToDioOptions(options) : null,
    );

    return dioResponseToResponseWrapper(res);
  }

  Future<HttpResponse> head(
    String path, {
    Map<String, dynamic>? queryParameters,
    RequestOptions? options,
  }) async {
    options ??= const RequestOptions();
    return await request(
      path: path,
      queryParameters: queryParameters,
      options: options.copyWith(method: "HEAD"),
    );
  }

  Future<HttpResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    RequestOptions? options,
  }) async {
    options ??= const RequestOptions();
    return await request(
      path: path,
      queryParameters: queryParameters,
      options: options.copyWith(method: "GET"),
    );
  }

  Future<HttpResponse> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    RequestOptions? options,
  }) async {
    options ??= const RequestOptions();
    return await request(
      path: path,
      data: data,
      queryParameters: queryParameters,
      options: options.copyWith(method: "POST"),
    );
  }

  Future<HttpResponse> put(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    RequestOptions? options,
  }) async {
    options ??= const RequestOptions();
    return await request(
      path: path,
      data: data,
      queryParameters: queryParameters,
      options: options.copyWith(method: "PUT"),
    );
  }

  Future<HttpResponse> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    RequestOptions? options,
  }) async {
    options ??= const RequestOptions();
    return await request(
      path: path,
      data: data,
      queryParameters: queryParameters,
      options: options.copyWith(method: "DELETE"),
    );
  }

  Future<HttpResponse> patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    RequestOptions? options,
  }) async {
    options ??= const RequestOptions();
    return await request(
      path: path,
      data: data,
      queryParameters: queryParameters,
      options: options.copyWith(method: "POST"),
    );
  }
}
