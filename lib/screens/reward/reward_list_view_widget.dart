import 'package:flutter/material.dart';
import 'dart:async';
import 'package:habitus/main/constants.dart';
import 'package:provider/provider.dart';
import 'package:habitus/providers/providers.dart';
import 'package:habitus/reusable_widgets/widgets.dart';

class RewardListView extends StatefulWidget {
  const RewardListView({super.key});

  @override
  RewardListViewState createState() => RewardListViewState();
}

class RewardListViewState extends State<RewardListView> {

  void startTimerForReward(Reward reward, Function updateBottomSheet) {
    reward.startTimer(() {
      updateBottomSheet();
      setState(() {});
    });
  }

  void showBottomSheet(BuildContext context, Reward reward) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              height: 600,
              color: Colors.white,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      reward.isExpired
                      ? 'Reward expired' 
                      : 'Reward expires in: ${reward.remainingTime.inHours} hrs ${reward.remainingTime.inMinutes % 60} mins',
                      style: AppTextStyles.paragraphTextStyle,
                    ),
                    const Spacer(),
                    Text(
                      'Reward achieved: ${reward.dateRewarded}',
                      style: AppTextStyles.paragraphTextStyle,
                    ),
                    const Spacer(),
                    const Text(
                      'Show barcode at gym reception to receive reward',
                      style: AppTextStyles.subtitleTextStyle,
                    )
                  ],
                ),
              )),
            );
          }
        );
      },
    );
  }



  void _handleButtonPress(Reward reward, Function() updateBottomSheet) {
    if (reward.isRedeemed) {
      showBottomSheet(context, reward);
    } else {
      setState(() {
        reward.redeemReward();
        startTimerForReward(reward, updateBottomSheet);
      });
    }
  }

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
                        subtitle: Text(reward.dateRewarded,
                            style: AppTextStyles.subtitleTextStyle),
                        tileColor: AppColours.displayBoxBackgroundColour,
                        trailing: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: reward.isRedeemed
                                ? const Color(0xFFC1E1C1)
                                : AppColours.widgetGreen, // Background color
                            foregroundColor: reward.isRedeemed
                                ? AppColours.mainFontColour
                                : Colors.white, // Text color
                          ),
                          onPressed: reward.isExpired? null : () {
                            _handleButtonPress(reward, () {
                              setState(() {});
                            });
                          },
                          child: Text(
                            reward.isExpired? 'Expired' :
                            (reward.isRedeemed ? 'View' : 'Redeem'),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
