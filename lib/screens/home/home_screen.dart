import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habitus/main/constants.dart';
import 'package:habitus/screens/home/days_of_week_letters_row.dart';
import 'package:habitus/screens/home/progress_circles_row.dart';
import 'package:habitus/global_widgets/widgets.dart';
import 'package:habitus/global_widgets/global_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: AppBarWidget(), body: HomeDisplay());
  }
}

class HomeDisplay extends StatefulWidget {
  const HomeDisplay({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeDisplay> {
  int totalScans = globalState.totalScans;
  Map<String, bool> scannedOnEachDayMap = {
    'Monday': true,
    'Tuesday': false,
    'Wednesday': true,
    'Thursday': true,
    'Friday': true,
    'Saturday': false,
    'Sunday': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          const Spacer(),
          const SizedBox(
            width: 300,
            child: Center(
              child: Text(
                "Streak:",
                style: AppTextStyles.paragraphTextStyle,
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
              width: AppDimensions.smallDisplaySquareLength,
              height: AppDimensions.smallDisplaySquareLength,
              child: Stack(
                children: [
                  const SizedBox(
                      width: AppDimensions.smallDisplaySquareLength,
                      height: AppDimensions.smallDisplaySquareLength,
                      child: BackgroundBoxWidget()),
                  Positioned(
                      top: 12,
                      left: 25,
                      right: 25,
                      child: SizedBox(
                          child: SvgPicture.asset(AppImages.streakIcon,
                              height: 35, width: 35))),
                  Positioned.fill(
                    top: 51,
                    bottom: 6,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("$totalScans",
                          style: AppTextStyles.paragraphTextStyle),
                    ),
                  )
                ],
              )),
          const Spacer(),
          const SizedBox(
            width: 300,
            child: Center(
              child: Text(
                "This Week",
                style: AppTextStyles.paragraphTextStyle,
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
              width: 307,
              height: 85,
              child: Stack(
                children: [
                  const SizedBox(
                    width: 307,
                    height: 85,
                    child: BackgroundBoxWidget(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const DaysOfWeekLettersRow(
                        daysOfWeekLetters: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
                      ),
                      ProgressCirclesRow(
                          scansForEachDayMap: scannedOnEachDayMap),
                    ],
                  ),
                ],
              )),
          const Spacer(),
        ]),
      ),
    );
  }
}
