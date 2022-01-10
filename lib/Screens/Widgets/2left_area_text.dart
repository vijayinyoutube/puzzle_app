import 'package:flutter/material.dart';
import 'package:puzzle_app/Constants/constants.dart';

import '../../Repository/homepage.dart';
import '../../ValueNotifier/homepage_notifier.dart';
import '../../Widgets/g_widgets.dart';

class LeftTextAreaClass extends StatelessWidget {
  const LeftTextAreaClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: homePageNotifier.n,
        builder: (context, value, _) {
          return buildleft_text();
        });
  }

  Widget buildleft_text() => Column(
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
                  secondaryColor,
                  () => homePageNotifier.setArray()),
              const WidthSpacer(myWidth: 15.00),
              buildButtom(
                  250,
                  const Padding(
                    padding: EdgeInsets.only(right: 9.0),
                    child: Text(
                      "Level",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  Padding(
                      padding: kPadding * 0.32,
                      child: buildFontStyleDropDownMenu()),
                  primaryColor,
                  () => {}),
            ],
          )
        ],
      );

  Widget buildButtom(double width, Widget child1, Widget child2,
          Color containerColor, Function myFunction) =>
      GestureDetector(
        onTap: () => myFunction(),
        child: Container(
          width: width,
          decoration:
              BoxDecoration(borderRadius: kBorder, color: containerColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              child1,
              child2,
            ],
          ),
        ),
      );

  Widget buildFontStyleDropDownMenu() => DropdownButton<String>(
        alignment: Alignment.center,
        value: HomePageRepo().levels[homePageNotifier.n.value],
        underline: Container(height: 2, color: Colors.white),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
        iconSize: 24,
        elevation: 16,
        items: HomePageRepo().levels.entries.map((items) {
          return DropdownMenuItem<String>(
            alignment: Alignment.center,
            value: items.value,
            child: Text(
              items.value,
              style: TextStyle(
                color: secondaryColor,
                fontSize: 20,
              ),
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          print("Clicked");
          var keys = HomePageRepo().levels.entries.firstWhere((element) {
            return element.value == newValue;
          });
          homePageNotifier.updateNVal(ValueNotifier(keys.key));
        },
      );
}
