import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habitus/reusable_widgets/background_box_widget.dart';
import 'package:habitus/main/constants.dart';



class SmallDisplaySquareWidget extends StatelessWidget {
  final String displayNumber;
  final String svgIcon;

  const SmallDisplaySquareWidget({
    super.key,
    required this.displayNumber,
    required this.svgIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.smallDisplaySquareLength,
      height: AppDimensions.smallDisplaySquareLength,
      child: Stack(
        children: [
          const SizedBox(
            width: AppDimensions.smallDisplaySquareLength,
            height: AppDimensions.smallDisplaySquareLength,
            child: BackgroundBoxWidget(),
          ),
          Positioned.fill(
            top: 51,
            bottom: 6,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                displayNumber,
                style: AppTextStyles.paragraphTextStyle,
              ),
            ),
          ),
          Positioned(
            top: 12,
            left: 25,
            right: 25,
            child: SvgPicture.asset(
              svgIcon,
              height: 35,
              width: 35,
            ),
          ),
        ],
      ),
    );
  }
}
