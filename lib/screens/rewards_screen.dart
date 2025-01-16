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
        drawer: Drawer(
          backgroundColor: AppColours.appBarColour,
          child: Text("hello"),
        ),
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

    return Scaffold(
        body: Center(
      child: Column(children: <Widget>[
        const Spacer(),
        const Text("Scans left until next reward:",
            style: AppTextStyles.paragraphTextStyle),
        const Spacer(),
        SmallDisplaySquareWidget(
            displayNumber: counterState.scansLeft,
            svgIcon: AppImages.qrCodeNavigationIcon),
        const Spacer(),
        const Text("Reward Progress:", style: AppTextStyles.paragraphTextStyle),
        const Spacer(),
        ProgressBarWidget(rewardProgress: scanProgress),
        const Spacer(),
        const Text("Your Reward:", style: AppTextStyles.paragraphTextStyle),
        const Spacer(),
        SizedBox(
            width: 307,
            height: 152,
            child: Center(
              child: Stack(
                children: [
                  const SizedBox(
                      width: 307, height: 152, child: BackgroundBoxWidget()),
                  Center(
                    child: (counterState.scansLeft == 0 && !rewardCollected)
                        ? ElevatedButton(
                            onPressed: collectReward,
                            child: const Text("Collect Reward"))
                        : Container(),
                  )
                ],
              ),
            )),
        const Spacer(),
        ElevatedButton(
            onPressed: counterState.resetScansLeft,
            child: const Text('Reset Scans Left')),
        const Spacer(),
      ]),
    ));
  }
}
