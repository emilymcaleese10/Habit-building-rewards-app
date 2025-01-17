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
                    style: AppTextStyles.noRewardsMessageTextStyle,
                  ),
                )
              : ListView.builder(
                  itemCount: rewardState.rewardsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final reward = rewardState.rewardsList[index];
                    return Card(
                      child: ListTile(
                        title: const Text('Reward',
                            style: AppTextStyles.paragraphTextStyle),
                        subtitle: Text(
                          reward.dateRewarded, // string
                          style: AppTextStyles.subtitleTextStyle,
                        ),
                        tileColor: AppColours.displayBoxBackgroundColour,
                        trailing: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColours.widgetGreen, // Background color
                            foregroundColor: Colors.white, // Text color
                          ),
                          onPressed: reward.isRedeemed? null: () {
                            setState(() {
                              reward.isRedeemed = true;
                            });
                            } ,
                          child: Text(
                            reward.isRedeemed ? 'Ready' : 'Redeem',
                          ),
                        ),
                        onTap: () {
                          if (reward.isRedeemed) {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 600,
                                  color: Colors.white,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(children: [
                                        const Text(
                                          'Reward expires in: 5 hrs 30 mins',
                                          style: AppTextStyles.paragraphTextStyle,
                                        ),
                                        Text(
                                          'Reward achieved: ${reward.dateRewarded}',
                                          style: AppTextStyles.paragraphTextStyle,
                                        ),
                                      ],),
                                    )
                                  ),
                                );
                              },
                            );
                          }
                        }
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
