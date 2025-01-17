import 'package:flutter/material.dart';
import 'package:habitus/reusable_widgets/widgets.dart';
import 'package:intl/intl.dart';

class RewardNotifier extends ChangeNotifier {
  final List<Reward> _rewardsList = [];
  List<Reward> get rewardsList => _rewardsList;

  String parseDate(DateTime date) {
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  void addNewReward() {
    rewardsList.insert(0, Reward(dateRewarded: parseDate(DateTime.now()))); //adds object to beginning of list
    notifyListeners();
  }
}
