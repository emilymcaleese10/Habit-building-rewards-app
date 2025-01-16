class GlobalState {
  static final GlobalState _instance = GlobalState._internal();
  factory GlobalState() => _instance;

  GlobalState._internal();

}

final globalState = GlobalState();
