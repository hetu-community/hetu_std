import 'dart:async' as async;

class StreamController {
  final async.StreamController _controller;

  StreamController({
    void Function()? onListen,
    void Function()? onPause,
    void Function()? onResume,
    async.FutureOr<void> Function()? onCancel,
    bool sync = false,
  }) : _controller = async.StreamController(
         onListen: onListen,
         onPause: onPause,
         onResume: onResume,
         onCancel: onCancel,
         sync: sync,
       );

  StreamController.broadcast({
    void Function()? onListen,
    async.FutureOr<void> Function()? onCancel,
    bool sync = false,
  }) : _controller = async.StreamController.broadcast(
         onListen: onListen,
         onCancel: onCancel,
         sync: sync,
       );

  void add(dynamic event) {
    _controller.add(event);
  }

  void addError(Object error, [StackTrace? stackTrace]) {
    _controller.addError(error, stackTrace);
  }

  void close() {
    _controller.close();
  }

  Future<void> get done => _controller.done;

  bool get isPaused => _controller.isPaused;

  Stream get stream => _controller.stream;

  bool get isClosed => _controller.isClosed;

  bool get hasListener => _controller.hasListener;
}
