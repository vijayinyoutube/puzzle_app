import 'package:flutter/material.dart';
import 'package:puzzle_app/Constants/constants.dart';
import 'package:puzzle_app/Screens/Widgets/2left_area_text.dart';
import 'package:puzzle_app/Screens/Widgets/3puzzle_container.dart';

import '../../ValueNotifier/homepage_notifier.dart';

class BuildBodyClass extends StatelessWidget {
  const BuildBodyClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            LeftTextAreaClass(),
            BuildPuzzleContainer(),
           
          ],
        ));
  }
}
