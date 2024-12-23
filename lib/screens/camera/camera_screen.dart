import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habitus/main/constants.dart';
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
      body: Center(
        child: Text('Camera Screen'),
      ),
    );
  }
}

