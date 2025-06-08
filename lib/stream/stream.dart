import 'dart:async' as async;

import 'package:hetu_std/stream/stream_subscription.dart';

class Stream {
  final async.Stream _stream;

  Stream(this._stream);

  Stream.empty() : _stream = async.Stream.empty();
  Stream.fromIterable(Iterable<dynamic> elements)
    : _stream = async.Stream.fromIterable(elements);

  StreamSubscription listen(
    void Function(dynamic event) onData, {
    Function? onError,
    void Function()? onDone,
    bool cancelOnError = false,
  }) {
    return StreamSubscription(
      _stream.listen(
        onData,
        onError: onError,
        onDone: onDone,
        cancelOnError: cancelOnError,
      ),
    );
  }

  async.Future<void> forEach(void Function(dynamic element) action) {
    return _stream.forEach(action);
  }

  async.Future<dynamic> firstWhere(
    bool Function(dynamic element) test, {
    dynamic Function()? orElse,
  }) {
    return _stream.firstWhere(test, orElse: orElse);
  }

  async.Future<dynamic> lastWhere(
    bool Function(dynamic element) test, {
    dynamic Function()? orElse,
  }) {
    return _stream.lastWhere(test, orElse: orElse);
  }

  async.Future<dynamic> singleWhere(
    bool Function(dynamic element) test, {
    dynamic Function()? orElse,
  }) {
    return _stream.singleWhere(test, orElse: orElse);
  }

  async.Future<List<dynamic>> toList() {
    return _stream.toList();
  }

  async.Future<Set<dynamic>> toSet() {
    return _stream.toSet();
  }

  async.Future<dynamic> reduce(
    dynamic Function(dynamic previous, dynamic element) combine,
  ) {
    return _stream.reduce(combine);
  }

  Future<dynamic> fold(
    dynamic initialValue,
    dynamic Function(dynamic previous, dynamic element) combine,
  ) {
    return _stream.fold(initialValue, combine);
  }

  async.Future<dynamic> drain([dynamic futureValue]) {
    return _stream.drain(futureValue);
  }

  async.Stream where(bool Function(dynamic element) test) {
    return _stream.where(test);
  }

  async.Stream map(dynamic Function(dynamic element) convert) {
    return _stream.map(convert);
  }

  async.Stream expand(Iterable<dynamic> Function(dynamic element) convert) {
    return _stream.expand(convert);
  }

  async.Future<bool> any(bool Function(dynamic element) test) {
    return _stream.any(test);
  }

  async.Future<bool> every(bool Function(dynamic element) test) {
    return _stream.every(test);
  }

  Future join(String separator) {
    return _stream.join(separator);
  }

  async.Future<dynamic> get first => _stream.first;
  async.Future<dynamic> get last => _stream.last;
  async.Future<dynamic> get single => _stream.single;
  async.Future<bool> get isEmpty => _stream.isEmpty;
  async.Future<int> get length => _stream.length;
  bool get isBroadcast => _stream.isBroadcast;
}
