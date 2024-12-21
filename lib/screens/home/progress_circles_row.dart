import 'package:flutter/material.dart';
import 'package:habitus/main/constants.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            AppValues.noOfdaysInWeek, // 7 days in week - print 7 circles
            (index) {
            return Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: getColourFromDayIndex(index), // if (scanned) circle = green; else circle = grey
                    shape: BoxShape.circle,
                  ),
                ),
              )
            );
          }
        ),
      ),
    );
  }
}
