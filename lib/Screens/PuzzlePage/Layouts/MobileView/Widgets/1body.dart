import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:odometer/odometer.dart';
import 'package:puzzle_app/Declarations/Images/image_files.dart';
import 'package:puzzle_app/Widgets/g_widgets.dart';
import 'package:day_night_switcher/day_night_switcher.dart';

import '../../../../../Declarations/Constants/constants.dart';
import '../../../../../Repository/homepage.dart';
import '../../../../../ValueNotifier/homepage_notifier.dart';
import '2left_area_text.dart';
import '3puzzle_container.dart';

class BuildBodyClass extends StatelessWidget {
  const BuildBodyClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: Theme.of(context).brightness.name == "light"
                  ? [HexColor("9ED1FF"), HexColor("FFFFFF")]
                  : [HexColor("#01407a"), HexColor("000000")])),
      height: double.infinity,
      child: SingleChildScrollView(
          child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -100,
            left: 470,
            child: Image.asset(
              images[3],
              height: 600,
            ),
          ),
          Positioned(
            bottom: -0,
            right: -0,
            child: Image.asset(
              images[4],
              height: 295,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LeftTextAreaClass(),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 120, top: 30, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    BuildPuzzleContainer(),
                    HeightSpacer(myHeight: 10),
                    BottomInfo(),
                  ],
                ),
              )
            ],
          ),
        ],
      )),
    );
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

  Widget buildDarkThemeToggleBtn() => FutureBuilder(
      future: HomePageRepo().getTheme(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            width: 65,
            child: DayNightSwitcher(
              isDarkModeEnabled: isDarkMode,
              onStateChanged: (bool value) {
                setState(() {
                  isDarkMode = value;
                  HomePageRepo().saveTheme(isDarkMode);
                  HomePageRepo().getTheme();
                });
              },
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      });

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
