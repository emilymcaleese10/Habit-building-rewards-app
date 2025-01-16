import 'package:flutter/material.dart';
import 'package:habitus/main/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habitus/screens/profile_screen.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColours.appBarColour,
        title: SvgPicture.asset(AppImages.habitusLogo,
            height: AppDimensions.habitusLogoHeight),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {Scaffold.of(context).openDrawer();},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
                side: const BorderSide(color: AppColours.backgroundWidgetGrey),
                padding: const EdgeInsets.all(4),
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => 
                    const ProfileScreen(),
                    ),
                );
              },
              child: const CircleAvatar(
                radius: 15,
                // backgroundImage: AssetImage('assets/images/roundedProfileIcon.svg'), // insert image here (find default)
              ),
            ),
          ),
        ]);
  }
}
