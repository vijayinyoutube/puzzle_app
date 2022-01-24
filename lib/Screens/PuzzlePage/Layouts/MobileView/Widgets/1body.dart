import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../../Widgets/1g_widgets.dart';
import '../../../../../Widgets/HomePageCmts/day_night_switcher.dart';
import '../../../../../Widgets/HomePageCmts/puzzle_widget.dart';
import '2tab_widget.dart';

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
      width: double.infinity,
      child: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                TabWidget(),
                HeightSpacer(myHeight: 10),
                BuildPuzzleContainer(
                  containerWidth: 75,
                ),
                HeightSpacer(myHeight: 10),
                BottomInfo(
                  containerWidth: 75,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
