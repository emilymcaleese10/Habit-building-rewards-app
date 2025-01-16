import 'package:flutter/material.dart';
import 'package:habitus/reusable_widgets/background_box_widget.dart';
import 'package:habitus/main/constants.dart';


class ProgressBarWidget extends StatelessWidget {
  final double rewardProgress;

  const ProgressBarWidget({
    super.key,
    required this.rewardProgress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 307,
      height: 88,
      child: Stack(
        children: [
          const SizedBox(
            width: 307,
            height: 88,
            child: BackgroundBoxWidget(),
          ),
          Center(
            child: SizedBox(
              width: 266,
              height: 31,
              child: LinearProgressIndicator(
                value: rewardProgress,
                color: AppColours.widgetGreen,
                backgroundColor: AppColours.backgroundWidgetGrey,
                borderRadius: BorderRadius.circular(35),
                minHeight: 31,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
