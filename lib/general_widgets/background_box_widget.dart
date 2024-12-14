import 'package:flutter/material.dart';
import 'package:habitus/constants.dart';

class BackgroundBoxWidget extends StatelessWidget {
  const BackgroundBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColours.displayBoxBackgroundColour,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: AppColours.shadowColour,
            blurRadius: 3,
            offset: Offset(0, 5), // Shadow position
          ),
        ],
      ),
    );
  }
}
