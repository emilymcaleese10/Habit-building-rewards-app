import 'package:flutter/material.dart';
import 'package:habitus/main/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habitus/screens/profile/profile_screen.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColours.appBarColour,
      title: SvgPicture.asset(
        AppImages.habitusLogo,
        height: AppDimensions.habitusLogoHeight),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
