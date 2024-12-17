import 'package:flutter/material.dart';
import 'package:habitus/constants.dart';

class ProgressCirclesRow extends StatefulWidget {
  final Map<String, bool> scansForEachDayMap;
  const ProgressCirclesRow({required this.scansForEachDayMap, super.key});

  @override
  State<ProgressCirclesRow> createState() => _ProgressCirclesRowState();
}

class _ProgressCirclesRowState extends State<ProgressCirclesRow> {
  List<Color> scannedColourList = [];

  @override
  void initState() {
    super.initState();
    createProgressCircleListFromMap(widget.scansForEachDayMap);
  }

  void createProgressCircleListFromMap(Map<String, bool> scannedOnEachDayMap) {
    List<bool> scannedBooleanList = scannedOnEachDayMap.values.toList();
    for (int i = 0; i < scannedBooleanList.length; i++) {
      scannedBooleanList[i]
          ? scannedColourList.add(AppColours.widgetGreen)
          : scannedColourList.add(AppColours.backgroundWidgetGrey);
    }
  }

  Color getColourFromDayIndex(int dayIndex) {
    return scannedColourList[dayIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        AppValues.noOfdaysInWeek, // 7 days in week
        (index) => Container(
          width: 27,
          height: 27,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: getColourFromDayIndex(index),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
