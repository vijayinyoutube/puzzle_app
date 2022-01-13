import 'package:flutter/material.dart';
import 'package:odometer/odometer.dart';
import 'package:puzzle_app/Screens/Widgets/2left_area_text.dart';
import 'package:puzzle_app/Screens/Widgets/3puzzle_container.dart';
import 'package:puzzle_app/Widgets/g_widgets.dart';
import '../../Declarations/Constants/constants.dart';
import '../../ValueNotifier/homepage_notifier.dart';

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
            MovesTextClass(),
          ],
        )
      ],
    ));
  }
}

class MovesTextClass extends StatelessWidget {
  const MovesTextClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: homePageNotifier.moves,
        builder: (context, value, _) {
          return buildMoveAnimationText();
        });
  }

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
