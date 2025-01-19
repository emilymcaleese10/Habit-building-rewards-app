import 'dart:async';

class Reward {
  final String dateRewarded;
  bool isRedeemed;
  bool isExpired;
  Duration remainingTime = const Duration(days: 1);
  Timer? _timer;

  Reward({
    required this.dateRewarded,
    this.isRedeemed = false,
    this.isExpired = false,
  });

  void redeemReward() {
    isRedeemed = true;
  }

  void expireReward() {
    isExpired = false;
  }

  void startTimer(Function onExpire) {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.inSeconds > 0) {
        remainingTime -= const Duration(seconds: 1);
      } else {
        timer.cancel();
        isExpired = true;
        onExpire();
      }
    });
  }

  void cancelTimer() {
    _timer?.cancel();
  }
}
