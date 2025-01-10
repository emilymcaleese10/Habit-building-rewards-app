import 'package:flutter/material.dart';

class ScanNotifier with ChangeNotifier {
  int _scansLeft = 3;

  int get scansLeft => _scansLeft;
  void decrementScansLeft() {
    _scansLeft--;
    notifyListeners();
  }
}
