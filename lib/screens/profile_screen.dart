import 'package:flutter/material.dart';
import 'package:habitus/screens/profile/profile_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ProfileAppBar(),
      body: Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}
