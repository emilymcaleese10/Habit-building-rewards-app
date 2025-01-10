import 'package:flutter/material.dart';
import 'package:habitus/main/constants.dart';

class ProgressCirclesRow extends StatefulWidget {
  final Map<String, bool> scansForEachDayMap;
  const ProgressCirclesRow({required this.scansForEachDayMap, super.key});

  @override
  State<ProgressCirclesRow> createState() => _ProgressCirclesRowState();
}

class _ProgressCirclesRowState extends State<ProgressCirclesRow> {
  late Map<String, bool> scansForEachDayMap;
  List<bool> scansForEachDayValues = [];

  @override
  void initState() {
    super.initState();
    scansForEachDayMap = widget.scansForEachDayMap;
    scansForEachDayValues = scansForEachDayMap.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: scansForEachDayMap.entries.map(
          (entry) {
            return Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: entry.value ? AppColours.widgetGreen : AppColours.backgroundWidgetGrey,
                    shape: BoxShape.circle, 
                  ),
                ),
              ),
            );
          }).toList(),
      )
    );
  }
}
