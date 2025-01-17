import 'package:flutter/material.dart';
import 'package:habitus/reusable_widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class RewardNotifier extends ChangeNotifier {
  final List<Reward> _rewardsList = [];
  List<Reward> get rewardsList => _rewardsList;

  String parseDate(DateTime date) {
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  void addNewReward() {
    var newReward = Reward(dateRewarded: parseDate(DateTime.now()));
    rewardsList.insert(0, newReward); //adds object to beginning of list
    notifyListeners();
  }

  void redeemReward(int index) {
    rewardsList[index].isRedeemed = true;

    Timer(const Duration(seconds: 5), () {
      rewardsList[index].isExpired = true; // expire when timer runs out
    });

    notifyListeners();
  }

}
