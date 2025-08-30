import 'package:flutter/material.dart';
import 'package:habitus/main/constants.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      backgroundColor: AppColours.appBarColour,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Settings", style: AppTextStyles.paragraphTextStyle),
            Text("Notifications", style: AppTextStyles.paragraphTextStyle),
            Text("Privacy Policy", style: AppTextStyles.paragraphTextStyle),
            Text("Terms and Conditions",
                style: AppTextStyles.paragraphTextStyle),
            Text("About", style: AppTextStyles.paragraphTextStyle),
            Text("Logout", style: AppTextStyles.paragraphTextStyle),
          ],
        ),
      ),
    );
  }
}
