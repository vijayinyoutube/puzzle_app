import 'package:confetti/confetti.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:puzzle_app/Declarations/Images/image_files.dart';
import 'package:puzzle_app/Widgets/1g_widgets.dart';
import '../../../../../Declarations/Constants/constants.dart';
import '../../../../../Repository/homepage.dart';
import '../../../../../ValueNotifier/homepage_notifier.dart';
import '../../../../../Widgets/HomePageCmts/day_night_switcher.dart';
import '../../../../../Widgets/HomePageCmts/moves_animtion.dart';
import '../../../../../Widgets/HomePageCmts/puzzle_widget.dart';
import '2left_area_text.dart';

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
        return SizedBox(
          width: (homePageNotifier.n.value * 100 +
                  HomePageRepo().getPaddingSPace(homePageNotifier.n.value))
              .toDouble(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              DayNightSwitch(),
              AnimatedMoves(),
            ],
          ),
        );
      },
    );
  }
}
