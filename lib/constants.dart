import 'package:flutter/material.dart';

class AppColours {
  static const Color bodyBackgroundColour = Color(0xFFF9F9F9); // light grey
  static const Color navBarColour = Colors.white;
  static const Color appBarColour = Colors.white;
  static const Color selectedIconColour = Colors.black;
  static const Color unselectedIconColour = Colors.grey;
  static const Color mainFontColour = Color(0xFF3A3B3C);
  static const Color displayBoxBackgroundColour = Colors.white;
  static const Color shadowColour = Color(0xFFE0E0E0);
  static const Color backgroundWidgetGrey = Color(0xFFEDEFF1);
  static const Color widgetGreen = Color(0xFF009C03);
}

class AppTextStyles {
  static const double paragraphfontSize = 20;
  static const String defaultFontFamily = 'Nunito';
  static const TextStyle paragraphTextStyle = TextStyle(
    color: AppColours.mainFontColour,
    fontSize: paragraphfontSize,
    fontFamily: AppTextStyles.defaultFontFamily,
    fontWeight: FontWeight.w900,
  );
}

class AppImages {
  static const String habitusLogo = 'assets/images/Primary Logo Simplified.svg';
  static const String homeNavigationIcon = 'assets/images/homeIcon.svg';
  static const String qrCodeNavigationIcon = 'assets/images/qrCodeIcon.svg';
  static const String giftNavigationIcon = 'assets/images/giftIcon.svg';
  static const String profileNavigationIcon =
      'assets/images/roundedProfileIcon.svg';
}

class AppDimensions {
  static const double habitusLogoHeight = 37;
  static const double appBarHeight = 56;
  static const double navBarIconSize = 25;
  static const double smallDisplaySquareLength = 85;
}
