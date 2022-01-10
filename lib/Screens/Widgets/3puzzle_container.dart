import 'package:flutter/material.dart';
import 'package:puzzle_app/Constants/constants.dart';
import '../../Repository/homepage.dart';
import '../../ValueNotifier/homepage_notifier.dart';
import '4inner_container.dart';

class BuildPuzzleContainer extends StatelessWidget {
  const BuildPuzzleContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<int>>(
        valueListenable: homePageNotifier.myArray,
        builder: (context, value, _) {
          return puzzleContainer();
        });
  }

  Widget puzzleContainer() => Container(
        alignment: Alignment.center,
        width: (100 * homePageNotifier.n.toDouble() +
            HomePageRepo().getPaddingSPace(homePageNotifier.n)),
        height: (100 * homePageNotifier.n.toDouble() +
            HomePageRepo().getPaddingSPace(homePageNotifier.n)),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          borderRadius: kBorder
        ),
        child: Wrap(
          children: [
            for (var i = 0; i < homePageNotifier.myArray.value.length; i++)
              BuildContainerClass(value: homePageNotifier.myArray.value[i]),
          ],
        ),
      );
}
