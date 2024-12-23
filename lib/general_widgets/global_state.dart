class GlobalState {
  static final GlobalState _instance = GlobalState._internal();
  factory GlobalState() => _instance;

  GlobalState._internal();

  int scansLeft = 3;
  int totalScans = 0;
}

final globalState = GlobalState();
