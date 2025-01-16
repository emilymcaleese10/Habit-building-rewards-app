import 'package:flutter/material.dart';
import 'package:habitus/main/constants.dart';
import 'package:provider/provider.dart';
import 'package:habitus/providers/providers.dart';

class RewardListView extends StatefulWidget {
  const RewardListView({super.key});

  @override
  RewardListViewState createState() => RewardListViewState();
}

class RewardListViewState extends State<RewardListView> {
  @override
  Widget build(BuildContext context) {
    final rewardState = context.watch<RewardNotifier>();
    return Column(
      children: [
        Expanded(
          child: rewardState.rewardsList.isEmpty
              ? const Center(
                  child: Text(
                    "Your rewards will appear here",
                    style: TextStyle(fontSize: 16),
                  ),
                )
              : ListView.builder(
                  itemCount: rewardState.rewardsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final reward = rewardState.rewardsList[index];
                    return Card(
                      child: ListTile(
                        title: const Text(
                          'Reward',
                          style: AppTextStyles.paragraphTextStyle
                        ),
                        subtitle: Text(
                          'Date Rewarded: ${reward.dateRewarded.toLocal()}',
                          style: AppTextStyles.subtitleTextStyle,
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
            onPressed: rewardState.addNewReward,
            child: const Text("Add Reward"),
          ),
        ),
      ],
    );
  }
}
