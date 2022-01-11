import 'package:flutter/material.dart';
import 'package:puzzle_app/Constants/constants.dart';
import 'package:puzzle_app/Screens/Widgets/2left_area_text.dart';
import 'package:puzzle_app/Screens/Widgets/3puzzle_container.dart';
import 'package:puzzle_app/Widgets/g_widgets.dart';

import '../../Repository/homepage.dart';
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
          return Text(
             "${homePageNotifier.moves.value} moves",
              style: TextStyle(
                color: secondaryColor,
                fontSize: 20,
              ),
            );
        });
  }
}