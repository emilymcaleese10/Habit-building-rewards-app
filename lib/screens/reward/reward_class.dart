class Reward {
  final DateTime dateRewarded;
  bool isRedeemed;

  Reward({
    required this.dateRewarded,
    this.isRedeemed = false,
  });
}
