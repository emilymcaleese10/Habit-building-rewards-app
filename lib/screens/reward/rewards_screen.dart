import 'package:flutter/material.dart';
import 'package:habitus/main/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habitus/general_widgets/widgets.dart';
import 'package:habitus/general_widgets/global_state.dart';

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
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<GoalProgress> {
  late int scansLeft;
  late int totalScans;
  late int scansRequiredForGoal;
  double get scanProgress =>
      (scansRequiredForGoal - scansLeft) / scansRequiredForGoal;
  late bool rewardCollected;
  late bool rewardReady;

  @override
  void initState() {
    super.initState();
    scansLeft = globalState.scansLeft;
    totalScans = globalState.totalScans;
    scansRequiredForGoal = 3;
    rewardCollected = false;
    rewardReady = false;
  }

  void updateCounters() {
    decrementScansLeft();
    incrementTotalScans();
  }

  void incrementTotalScans() {
    setState(() {
      totalScans++;
      globalState.totalScans = totalScans;
    });
  }

  void decrementScansLeft() {
    setState(() {
      if (scansLeft > 0) {
        scansLeft--;
        rewardCollected = false;
        rewardReady = false;
        globalState.scansLeft = scansLeft;
      } else {
        rewardReady = true;
      }
    });
  }

  void collectReward() {
    setState(() {
      if (!rewardCollected && scansLeft == 0) {
        scansLeft = 3;
        rewardCollected = true;
        globalState.scansLeft = scansLeft;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(children: <Widget>[
        const Spacer(),
        const SizedBox(
            width: 300,
            child: Center(
                child: Text(
              "Scans left until next reward:",
              style: AppTextStyles.paragraphTextStyle,
            ))),
        const Spacer(),
        SizedBox(
            width: AppDimensions.smallDisplaySquareLength,
            height: AppDimensions.smallDisplaySquareLength,
            child: Stack(
              children: [
                const SizedBox(
                    width: AppDimensions.smallDisplaySquareLength,
                    height: AppDimensions.smallDisplaySquareLength,
                    child: BackgroundBoxWidget()),
                Positioned.fill(
                  top: 51,
                  bottom: 6,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text("$scansLeft",
                        style: AppTextStyles.paragraphTextStyle),
                  ),
                ),
                Positioned(
                    top: 12,
                    left: 25,
                    right: 25,
                    child: SizedBox(
                        child: SvgPicture.asset(AppImages.qrCodeNavigationIcon,
                            height: 35, width: 35)))
              ],
            )),
        const Spacer(),
        const Text("Reward Progress:", style: AppTextStyles.paragraphTextStyle),
        const Spacer(),
        SizedBox(
            width: 307,
            height: 88,
            child: Stack(
              children: [
                const SizedBox(
                  width: 307,
                  height: 88,
                  child: BackgroundBoxWidget(),
                ),
                Center(
                    child: SizedBox(
                  width: 266,
                  height: 31,
                  child: LinearProgressIndicator(
                    value: scanProgress,
                    color: AppColours.widgetGreen,
                    backgroundColor: AppColours.backgroundWidgetGrey,
                    borderRadius: BorderRadius.circular(35),
                  ),
                ))
              ],
            )),
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
                    child: (scansLeft == 0 && !rewardCollected)
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
            onPressed: updateCounters, child: const Text("Simulate QR Scan")),
        const Spacer()
      ]),
    )));
  }
}
