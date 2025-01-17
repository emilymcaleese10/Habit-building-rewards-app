class Reward {
  final String dateRewarded;
  bool isRedeemed;
  bool isExpired;

  Reward({
    required this.dateRewarded,
    this.isRedeemed = false,
    this.isExpired = false,
  });
}
