import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StreakNotifier with ChangeNotifier {
  DateTime _lastScan;

  StreakNotifier({DateTime? lastScan}) : _lastScan = lastScan ?? DateTime.now();

  int _streak = 0;
  int get streak => _streak;

  void updateStreak({DateTime? currentDateTime}) {
    DateTime now = currentDateTime ??
        DateTime
            .now(); // ?? makes whatever after it default value (if the value before it is null)
    int difference = now.difference(_lastScan).inDays;

    if (_streak == 0) {
      _streak = 1; // initialise streak if it hasn't been
    } else if (difference == 1) {
      _streak++; // increment streak in case of consecutive days
    } else if (difference > 1) {
      _streak = 1; // reset streak in case of gap between scans
    }

    _lastScan = now;
    notifyListeners();
  }

  void setLastScan(DateTime date) {
    _lastScan = date;
  }
}
