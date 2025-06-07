import 'dart:async' as async;

class StreamSubscription {
  final async.StreamSubscription _subscription;

  StreamSubscription(this._subscription);

  async.Future<T> asFuture<T>([T? futureValue]) {
    return _subscription.asFuture(futureValue);
  }

  void cancel() {
    _subscription.cancel();
  }

  void pause([Future<void>? resumeSignal]) {
    _subscription.pause(resumeSignal);
  }

  void resume() {
    _subscription.resume();
  }

  bool get isPaused => _subscription.isPaused;
}
