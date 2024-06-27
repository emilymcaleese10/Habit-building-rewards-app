import 'package:flutter/material.dart';
import 'dart:async';

class RewardsProvider with ChangeNotifier {
  int _counter = 0;
  Timer? _timer;
  bool _isTimerRunning = false;
  int _remainingTime = 0;

  int get counter => _counter;
  bool get isTimerRunning => _isTimerRunning;
  int get remainingTime => _remainingTime;

  void incrementCounter() {
    if (_counter < 3) {
      _counter++;
      if (_counter == 3) {
        _startTimer();
      }
      notifyListeners();
    }
  }

  void _startTimer() {
    _isTimerRunning = true;
    _remainingTime = 10;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _remainingTime--;
      notifyListeners();
      if (_remainingTime <= 0) {
        _resetCounter();
      }
    });
  }

  void _resetCounter() {
    _timer?.cancel();
    _isTimerRunning = false;
    _counter = 0;
    notifyListeners();
  }
}
