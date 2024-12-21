import 'package:flutter/material.dart';
import 'screens.dart';
import 'constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ScanScreen(),
    const RewardsScreen(),
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
            icon: SvgPicture.asset(AppImages.homeNavigationIcon,
                height: 25, width: 25),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.qrCodeNavigationIcon,
                height: 25, width: 25),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.giftNavigationIcon,
                height: 27, width: 27),
            label: 'Rewards',
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
