// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'screens/screens.dart';
import 'constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const HabitusApp());
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

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 2;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ScanScreen(),
    const RewardsScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColours.navBarColour,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppImages.homeNavigationIcon,
              height: 25, 
              width: 25),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppImages.qrCodeNavigationIcon,
              height: 25, 
              width: 25),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppImages.giftNavigationIcon,
              height: 27, 
              width: 27),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppImages.profileNavigationIcon,
              height: 25, 
              width: 25),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColours.selectedIconColour,
        unselectedItemColor: AppColours.unselectedIconColour,
        onTap: _onItemTapped,
      ),
    );
  }
}
