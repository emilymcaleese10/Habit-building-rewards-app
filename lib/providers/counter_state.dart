import 'package:flutter/material.dart';

class CounterNotifier with ChangeNotifier {
  int _totalLogs = 0;
  final int _goal = 3;
  int _currentLogs = 0;

  int get totalLogs => _totalLogs;
  int get goal => _goal;
  int get currentLogs => _currentLogs;

  void updateCounters() {
    incrementTotalScans();
    incrementCurrentLogs();
  }

  void incrementCurrentLogs () {
    if (_currentLogs < _goal) {
      _currentLogs++;
    }
    notifyListeners();
  }

  void resetCurrentLogs() {
    _currentLogs = 0;
    notifyListeners();
  }

  void incrementTotalScans() {
    _totalLogs++;
    notifyListeners();
  }
  
  // code for reward screen
  int get scansLeft => _goal - _currentLogs;
}
