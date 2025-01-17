import 'package:flutter/material.dart';
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

  void showBottomSheet(BuildContext context, String dateRewarded) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 600,
          color: Colors.white,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  'Reward expires in: 5 hrs 30 mins',
                  style: AppTextStyles.paragraphTextStyle,
                ),
                const Spacer(),
                Text(
                  'Reward achieved: $dateRewarded',
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
      },
    );
  }

  void _handleButtonPress(Reward reward) {
    if (reward.isRedeemed) {
      showBottomSheet(context, reward.dateRewarded);
    } else {
      setState(() {
        reward.redeemReward();
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
                            backgroundColor: reward.isRedeemed? const Color(0xFFC1E1C1) : AppColours.widgetGreen, // Background color
                            foregroundColor: reward.isRedeemed? AppColours.mainFontColour : Colors.white, // Text color
                          ),
                          onPressed: () {
                            _handleButtonPress(reward);
                          },
                          child: Text(
                            reward.isRedeemed ? 'View' : 'Redeem',
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
