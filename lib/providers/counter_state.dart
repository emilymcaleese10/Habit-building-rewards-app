import 'package:flutter/material.dart';

class CounterNotifier with ChangeNotifier {
  int _scansLeft = 3;
  int _totalScans = 0;
  int get scansLeft => _scansLeft;
  int get totalScans => _totalScans;

  void updateCounters() {
    decrementScansLeft();
    incrementTotalScans();
  }

  void decrementScansLeft() {
    _scansLeft--;
    notifyListeners();
  }

  void resetScansLeft() {
    _scansLeft = 3;
    notifyListeners();
  }

  void incrementTotalScans() {
    _totalScans++;
    notifyListeners();
  }
}
