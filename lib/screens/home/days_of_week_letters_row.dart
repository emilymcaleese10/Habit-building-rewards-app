import 'package:flutter/material.dart';
import 'package:habitus/main/constants.dart';

class DaysOfWeekLettersRow extends StatelessWidget {
  final List<String> daysOfWeekLetters;
  const DaysOfWeekLettersRow({required this.daysOfWeekLetters, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(AppValues.noOfdaysInWeek, // 7 days in week
            (index) {
          return Expanded(
            flex: 1,
            child: Center(
              child: Text(
                daysOfWeekLetters[index],
                style: AppTextStyles.paragraphTextStyle,
              ),
            ),
          );
        }),
      ),
    );
  }
}
