import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../Declarations/Constants/constants.dart';
import '../../Repository/homepage.dart';
import '../../ValueNotifier/homepage_notifier.dart';
import '4inner_container.dart';

class BuildPuzzleContainer extends StatelessWidget {
  const BuildPuzzleContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: homePageNotifier.n,
        builder: (context, value, _) {
          return ValueListenableBuilder<List<int>>(
              valueListenable: homePageNotifier.myArray,
              builder: (context, value, _) {
                return puzzleContainer(context);
              });
        });
  }

  Widget puzzleContainer(BuildContext context) => Card(
        elevation: 30.0,
        shape: RoundedRectangleBorder(borderRadius: kBorder),
        child: Container(
          alignment: Alignment.center,
          width: (100 * homePageNotifier.n.value.toDouble() +
              HomePageRepo().getPaddingSPace(homePageNotifier.n.value)),
          height: (100 * homePageNotifier.n.value.toDouble() +
              HomePageRepo().getPaddingSPace(homePageNotifier.n.value)),
          decoration: BoxDecoration(
            
            border: Border.all(color: Colors.blueAccent),
            borderRadius: kBorder,
            color: Theme.of(context).brightness.name == "light"
                ? HexColor("#fafafa")
                : HexColor("#303030"),
          ),
          child: Wrap(
            children: [
              for (var i = 0; i < homePageNotifier.myArray.value.length; i++)
                BuildContainerClass(value: homePageNotifier.myArray.value[i]),
            ],
          ),
        ),
      );
}
