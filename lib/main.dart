// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'main/main_screen.dart';
import 'main/constants.dart';
import 'package:habitus/general_widgets/scan_state_management.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ScanNotifier(),
      child: const HabitusApp(),
    ),
  );
}

class HabitusApp extends StatelessWidget {
  const HabitusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habitus',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColours.bodyBackgroundColour,
      ),
      home: const MainScreen(),
    );
  }
}
