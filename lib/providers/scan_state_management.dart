import 'package:flutter/material.dart';

class ScanNotifier with ChangeNotifier {
  int _scansLeft = 3;
  int _totalScans = 0;
  int get scansLeft => _scansLeft;
  int get totalScans => _totalScans;


  Map<String, bool> scansForEachDayMap = {
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
    'Sunday': false,
  };

  void updateCounters() {
    decrementScansLeft();
    incrementTotalScans();
    updateProgressCirclesMap();
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

  void updateProgressCirclesMap() {
    List<String> daysList = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    DateTime now = DateTime.now();
    int weekDayMapIndex = (now.weekday) - 1; // Monday=1 -> Monday=0
    String day = daysList[weekDayMapIndex];
    scansForEachDayMap[day] = true;
    notifyListeners();
  }
}
