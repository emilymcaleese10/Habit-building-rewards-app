import 'package:flutter/material.dart';
import 'package:habitus/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColours.appBarColour,
      title: SvgPicture.asset(
        AppImages.habitusLogo,
        height: AppDimensions.habitusLogoHeight
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      )
    );
  }
}
