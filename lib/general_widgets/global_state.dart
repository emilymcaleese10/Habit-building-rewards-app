class GlobalState {
  static final GlobalState _instance = GlobalState._internal();
  factory GlobalState() => _instance;

  GlobalState._internal();

  int scansLeft = 3;
  int totalScans = 0;
  Map<String, bool> scansForEachDayMap = {
      'Monday': true,
      'Tuesday': false,
      'Wednesday': false,
      'Thursday': false,
      'Friday': false,
      'Saturday': false,
      'Sunday': false,
    };
}

final globalState = GlobalState();
