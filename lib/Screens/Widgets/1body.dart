import 'package:flutter/material.dart';
import 'package:puzzle_app/Constants/constants.dart';
import 'package:puzzle_app/Screens/Widgets/2left_area_text.dart';
import 'package:puzzle_app/Screens/Widgets/3puzzle_container.dart';

class BuildBodyClass extends StatelessWidget {
  const BuildBodyClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: kPadding * 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Expanded(flex: 3, child: LeftTextAreaClass()),
          BuildPuzzleContainer(),
        ],
      ),
    ));
  }
}
