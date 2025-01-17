class Reward {
  final String dateRewarded;
  bool isRedeemed;
  bool expired;

  Reward({
    required this.dateRewarded,
    this.isRedeemed = false,
    this.expired = false,
  });
}
