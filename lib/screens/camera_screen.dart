import 'package:flutter/material.dart';
import 'package:habitus/main/constants.dart';
import 'package:provider/provider.dart';
import 'package:habitus/general_widgets/widgets.dart';

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
  late int scansLeft;
  late int totalScans;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(
        child: ElevatedButton(
            onPressed: () {
              Provider.of<ScanNotifier>(context, listen: false).decrementScansLeft();
            },
            child: const Text("Simulate QR Scan")),
      ),
    ]);
  }
}
