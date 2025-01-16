import 'package:flutter/material.dart';
import 'package:habitus/reusable_widgets/widgets.dart';

class RewardListView extends StatefulWidget {
  const RewardListView({super.key});

  @override
  RewardListViewState createState() => RewardListViewState();
}

class RewardListViewState extends State<RewardListView> {
  List<Reward> rewardsList = [];

  void _addNewReward() {
    setState(() {
      rewardsList.add(Reward(dateRewarded: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(
            child: rewardsList.isEmpty
                ? const Center(
                    child: Text(
                      "Your rewards will appear here",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    itemCount: rewardsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final reward = rewardsList[index];
                      return Card(
                        child: ListTile(
                          title: const Text('Reward'),
                          subtitle: Text(
                            'Date Rewarded: ${reward.dateRewarded.toLocal()}',
                            style: const TextStyle(fontSize: 12),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                reward.isRedeemed = !reward.isRedeemed;
                              });
                            },
                            child: Text(
                              reward.isRedeemed ? 'Ready' : 'Redeem',
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _addNewReward,
              child: const Text("Add Reward"),
            ),
          ),
        ],
    );
  }
}
