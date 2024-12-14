import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habitus/constants.dart';
import 'package:habitus/general_widgets/progress_circles_row.dart';
import 'package:habitus/general_widgets/widgets.dart';

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
  int streak = 0;

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
                "Scans left until next reward:",
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
                      child: Text("$streak",
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
          const SizedBox(
            width: 307,
            height: 88,
            child: Stack(
              children: [
                SizedBox(
                  width: 307,
                  height: 88, 
                  child: BackgroundBoxWidget(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProgressCirclesRow(),
                  ],
                ),
              ],
            )
          ),
          const Spacer(),
        ]),
      ),
    );
  }
}
