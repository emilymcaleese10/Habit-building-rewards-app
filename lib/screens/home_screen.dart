import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:habitus/main/constants.dart';
import 'package:habitus/reusable_widgets/widgets.dart';
import 'package:habitus/providers/providers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: AppBarWidget(), drawer: HomeDrawer(), body: HomeDisplay());
  }
}

class HomeDisplay extends StatefulWidget {
  const HomeDisplay({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeDisplay> {
  double get scanProgress {
    final logState = context.watch<CounterNotifier>();
    return (logState.goal - logState.scansLeft) / logState.goal;
  }

  @override
  Widget build(BuildContext context) {
    final logState = context.watch<CounterNotifier>();
    final streakState = context.watch<StreakNotifier>();

    return Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          const Spacer(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 100,
                child: Center(
                  child: Text(
                    "Progress",
                    style: AppTextStyles.paragraphTextStyle,
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                child: Center(
                  child: Text(
                    "Streak",
                    style: AppTextStyles.paragraphTextStyle,
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                child: Center(
                  child: Text(
                    "Goal",
                    style: AppTextStyles.paragraphTextStyle,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SmallDisplaySquareWidget(
                displayNumber: '${logState.currentLogs} / ${logState.goal}',
                svgIcon: AppImages.tickIcon,
              ),
              SmallDisplaySquareWidget(
                displayNumber: streakState.streak.toString(),
                svgIcon: AppImages.streakIcon,
              ),
              SmallDisplaySquareWidget(
                displayNumber: '${logState.goal}',
                svgIcon: AppImages.barbellIcon,
              ),
            ],
          ),
          const Spacer(),
          const Text("Reward Progress:",
              style: AppTextStyles.paragraphTextStyle),
          const Spacer(),
          ProgressBarWidget(rewardProgress: scanProgress),
          const Spacer(),
          const SizedBox(
            width: 300,
            child: Center(
              child: Text(
                "This Week",
                style: AppTextStyles.paragraphTextStyle,
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
              width: 307,
              height: 85,
              child: Stack(
                children: [
                  const SizedBox(
                    width: 307,
                    height: 85,
                    child: BackgroundBoxWidget(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const DaysOfWeekLettersRow(
                        daysOfWeekLetters: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
                      ),
                      ProgressCirclesRow(
                          scansForEachDayMap: streakState.scansForEachDayMap),
                    ],
                  ),
                ],
              )),
          const Spacer(),
        ]),
      ),
    );
  }
}
