import 'dart:async';

class MainScreenBlock {
  // int? currentIndex = 0;

  final _currentIndex = StreamController<int>.broadcast();

  Stream<int> get currentIndex => _currentIndex.stream;

  Function(int) get setCurrentIndex => _currentIndex.sink.add;

  dispose() {
    _currentIndex.close();
  }
}
