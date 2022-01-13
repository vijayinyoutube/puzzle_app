import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odometer/odometer.dart';
import 'package:puzzle_app/Screens/Widgets/2left_area_text.dart';
import 'package:puzzle_app/Screens/Widgets/3puzzle_container.dart';
import 'package:puzzle_app/Widgets/g_widgets.dart';
import '../../Declarations/Constants/constants.dart';
import '../../Repository/homepage.dart';
import '../../ValueNotifier/homepage_notifier.dart';
import '../../main.dart';
import 'package:day_night_switcher/day_night_switcher.dart';

class BuildBodyClass extends StatelessWidget {
  const BuildBodyClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const LeftTextAreaClass(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            BuildPuzzleContainer(),
            HeightSpacer(myHeight: 10),
            BottomInfo(),
          ],
        )
      ],
    ));
  }
}

class BottomInfo extends StatefulWidget {
  const BottomInfo({Key? key}) : super(key: key);

  @override
  State<BottomInfo> createState() => _BottomInfoState();
}

class _BottomInfoState extends State<BottomInfo> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: homePageNotifier.n,
      builder: (context, value, _) {
        return ValueListenableBuilder<int>(
            valueListenable: homePageNotifier.moves,
            builder: (context, value, _) {
              return SizedBox(
                width: (homePageNotifier.n.value * 100 +
                        HomePageRepo()
                            .getPaddingSPace(homePageNotifier.n.value))
                    .toDouble(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildDarkThemeToggleBtn(),
                    buildMoveAnimationText(),
                  ],
                ),
              );
            });
      },
    );
  }

  Widget buildDarkThemeToggleBtn() => SizedBox(
        width: 65,
        child: DayNightSwitcher(
          isDarkModeEnabled: isDarkMode,
          onStateChanged: (bool value) {
            setState(() {
              isDarkMode = value;
              HomePageRepo().saveTheme(isDarkMode);
              runApp(MyApp(themedata: isDarkMode));
            });
          },
        ),
      );

  Widget buildMoveAnimationText() => Row(
        children: [
          AnimatedSlideOdometerNumber(
            numberTextStyle: TextStyle(
              fontSize: 20,
              color: secondaryColor,
            ),
            odometerNumber: OdometerNumber(homePageNotifier.moves.value),
            duration: const Duration(milliseconds: 500),
            letterWidth: 12,
          ),
          const WidthSpacer(myWidth: 5.5),
          Text(
            "moves",
            style: TextStyle(
              color: secondaryColor,
              fontSize: 20,
            ),
          ),
        ],
      );
}
