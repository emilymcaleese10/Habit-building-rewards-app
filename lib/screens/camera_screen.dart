import 'package:flutter/material.dart';
import 'package:habitus/main/constants.dart';
import 'package:provider/provider.dart';
import 'package:habitus/general_widgets/widgets.dart';
import 'package:habitus/providers/streak_state_management.dart';

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
  final scanState = context.watch<ScanNotifier>();

    return Column(children: [
      Center(
        child: ElevatedButton(
          onPressed: () {
            streakState.updateStreak();
            scanState.updateCounters();
          },
          child: const Text("Simulate QR Scan"),
        ),
      ),
    ]);
  }
}
