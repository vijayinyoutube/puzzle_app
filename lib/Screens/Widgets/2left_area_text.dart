import 'package:flutter/material.dart';
import 'package:puzzle_app/Constants/constants.dart';

import '../../Repository/homepage.dart';
import '../../Widgets/g_widgets.dart';

class LeftTextAreaClass extends StatelessWidget {
  const LeftTextAreaClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "FlutterWeb",
          style: TextStyle(color: secondaryColor, fontSize: 30),
        ),
        const HeightSpacer(myHeight: 15.00),
        Text(
          "#PuzzleChallenge",
          style: TextStyle(
              color: primaryColor, fontSize: 50, fontWeight: FontWeight.bold),
        ),
        const HeightSpacer(myHeight: 15.00),
        Row(
          children: [
            buildButtom(
                175,
                const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                Padding(
                  padding: kPadding * 1.5,
                  child: const Text(
                    "Shuffle",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                secondaryColor,()=>HomePageRepo().setArray()),
            WidthSpacer(myWidth: 15.00),
            buildButtom(
                250,
                const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                Padding(
                  padding: kPadding * 1.5,
                  child: const Text(
                    "Shuffle",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                primaryColor,()=>printData()),
          ],
        )
      ],
    );
  }

  Widget buildButtom(
          double width, Widget child1, Widget child2, Color containerColor,Function myFunction) =>
      GestureDetector(
        onTap: ()=>myFunction(),
        child: Container(
          width: width,
          decoration: BoxDecoration(borderRadius: kBorder, color: containerColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              child1,
              child2,
            ],
          ),
        ),
      );

  printData() {
    print("Hai");
  }
}
