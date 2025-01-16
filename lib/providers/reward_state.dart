import 'package:flutter/material.dart';
import 'package:habitus/reusable_widgets/widgets.dart';

class RewardNotifier extends ChangeNotifier {
  final List<Reward> _rewardsList = [];
  List<Reward> get rewardsList => _rewardsList;

  void addNewReward() {
    rewardsList.add(Reward(dateRewarded: DateTime.now()));
    notifyListeners();
  }
}
