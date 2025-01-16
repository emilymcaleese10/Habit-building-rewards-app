import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:habitus/main/constants.dart';
import 'package:habitus/reusable_widgets/widgets.dart';
import 'package:habitus/providers/providers.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: AppBarWidget(),
        drawer: Drawer(
          backgroundColor: AppColours.appBarColour,
          child: Text("hello"),
        ),
        body: ScanProgress());
  }
}

class ScanProgress extends StatefulWidget {
  const ScanProgress({super.key});

  @override
  ScanState createState() => ScanState();
}

class ScanState extends State<ScanProgress> {
  @override
  Widget build(BuildContext context) {
    final streakState = context.watch<StreakNotifier>();
    final counterState = context.watch<CounterNotifier>();

    return Column(children: [
      Center(
        child: ElevatedButton(
          onPressed: () {
            streakState.updateStreak(currentDateTime: streakState.currentDay);
            streakState.updateProgressCirclesMap(currentDateTime: streakState.currentDay);
            counterState.updateCounters();
          },
          child: const Text("Simulate QR Scan"),
        ),
      ),
      Center(
          child: ElevatedButton(
        onPressed: () {
          streakState.currentDay =
              (streakState.currentDay).add(const Duration(days: 1));
        },
        child: const Text("Increment day"),
      )),
      Center(
        child: Text("Current day: ${streakState.currentDay}"),
      ),
      Center(
        child: Text("current streak: ${streakState.streak}"),
      ),
      const Center(
        child: Text("Scan again in: "),
      ),
      ElevatedButton(
            onPressed: counterState.resetScansLeft,
            child: const Text('Reset Scans Left')),
        const Spacer(),
    ]);
  }
}
