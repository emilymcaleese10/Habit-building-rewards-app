import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:habitus/main/constants.dart';
import 'package:habitus/reusable_widgets/widgets.dart';
import 'package:habitus/providers/providers.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: AppBarWidget(),
        drawer: HomeDrawer(),
        body: GoalProgress());
  }
}

class GoalProgress extends StatefulWidget {
  const GoalProgress({super.key});

  @override
  ProgressState createState() => ProgressState();
}

class ProgressState extends State<GoalProgress> {
  late int scansRequiredForGoal;
  late bool rewardCollected;
  late bool rewardReady;

  @override
  void initState() {
    super.initState();
    scansRequiredForGoal = 3;
    rewardCollected = false;
    rewardReady = false;
  }

  double get scanProgress {
    final scanState = context.watch<CounterNotifier>();
    return (scansRequiredForGoal - scanState.scansLeft) / scansRequiredForGoal;
  }

  void updateRewardState() {
    final scanState = context.read<CounterNotifier>();
    setState(() {
      if (scanState.scansLeft > 0) {
        rewardCollected = false;
        rewardReady = false;
      } else {
        rewardReady = true;
      }
    });
  }

  void collectReward() {
    final scanState = context.read<CounterNotifier>();
    setState(() {
      if (!rewardCollected && scanState.scansLeft == 0) {
        rewardCollected = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final counterState = context.watch<CounterNotifier>();
    final rewardState = context.watch<RewardNotifier>();

    return Scaffold(
      body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              // minHeight: 600,
              maxHeight: 600,
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  const Spacer(),
                  const Text(
                    "Scans left until next reward:",
                    style: AppTextStyles.paragraphTextStyle
                  ),
                  const Spacer(),
                  SmallDisplaySquareWidget(
                    displayNumber: counterState.scansLeft,
                    svgIcon: AppImages.qrCodeNavigationIcon
                  ),
                  const Spacer(),
                  const Text("Reward Progress:", style: AppTextStyles.paragraphTextStyle),
                  const Spacer(),
                  ProgressBarWidget(rewardProgress: scanProgress),
                  const Spacer(),
                  const Text("Your Reward:", style: AppTextStyles.paragraphTextStyle),
                  const Spacer(),
                  const SizedBox(
                    width: 307,
                    height: 220,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 307, height: 220,
                          child: BackgroundBoxWidget(),
                        ),
                        RewardListView(),
                      ]
                    )
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: rewardState.addNewReward,
                    child: const Text("Add Reward"),
                  ),
                  const Spacer(),
                ]
              ),
            ),
          ),
      )
    );
  }
}
