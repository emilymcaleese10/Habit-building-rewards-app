import 'package:flutter/material.dart';
import 'package:habitus/screens/profile/profile_app_bar.dart';

import 'package:provider/provider.dart';
import 'package:habitus/providers/providers.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final streakState = context.watch<StreakNotifier>();
    final counterState = context.watch<CounterNotifier>();
    return Scaffold(
      appBar: const ProfileAppBar(),
      body: Column(children: [
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
      ElevatedButton(
            onPressed: counterState.resetCurrentLogs,
            child: const Text('Reset Scans Left')),
        const Spacer(),
    ]),
    );
  }
}
