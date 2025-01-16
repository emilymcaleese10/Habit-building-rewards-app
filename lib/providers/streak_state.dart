import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StreakNotifier with ChangeNotifier {
  DateTime _lastScan;
  DateTime currentDay = DateTime(2025, 1, 1); // for manual testing

  StreakNotifier({DateTime? lastScan}) : _lastScan = lastScan ?? DateTime.now();

  int _streak = 0;
  int get streak => _streak;

  Map<String, bool> scansForEachDayMap = {
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
    'Sunday': false,
  };

  void updateStreak({DateTime? currentDateTime}) {
    DateTime now = currentDateTime ?? DateTime.now(); // ?? makes whatever after it default value (if the value before it is null)
    int difference = now.difference(_lastScan).inDays;

    if (_streak == 0) {
      _streak = 1; // initialise streak if it hasn't been
    } else if (difference == 1) {
      _streak++;
    } else if (difference > 1) {
      _streak = 1; // reset streak
    }

    _lastScan = now;
    notifyListeners();
  }

  void setLastScan(DateTime date) {
    _lastScan = date;
  }

  void updateProgressCirclesMap({DateTime? currentDateTime}) {
    List<String> daysList = ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
    DateTime now = currentDateTime ?? DateTime.now();
    int weekDayMapIndex = (now.weekday) - 1; // Monday=1 -> Monday=0
    String day = daysList[weekDayMapIndex];
    scansForEachDayMap[day] = true;
    notifyListeners();
  }
}
