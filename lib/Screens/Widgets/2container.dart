import 'package:flutter/material.dart';

import '../../ValueNotifier/homepage_notifier.dart';
import 'package:hexcolor/hexcolor.dart';

class BuildContainerClass extends StatelessWidget {
  const BuildContainerClass({Key? key, required this.value}) : super(key: key);

  final int value;

  static int zeroIndex = homePageNotifier.myArray.value.indexOf(0);
  static int lastClicked = 0;

  @override
  Widget build(BuildContext context) {
    return buildContainers(value, context);
  }

  buildContainers(int value, BuildContext context) {
    switch (value) {
      case 1:
        return buildColorContainer(value, context);
      case 2:
        return buildColorContainer(value, context);
      case 3:
        return buildColorContainer(value, context);
      case 4:
        return buildColorContainer(value, context);
      case 5:
        return buildColorContainer(value, context);
      case 0:
        return buildColorContainer(value, context);
    }
  }

  Widget buildColorContainer(int index, BuildContext context) =>
      GestureDetector(
        onTap: () {
          lastClicked = index;
          zeroIndex = homePageNotifier.myArray.value.indexOf(0);
          if ((homePageNotifier.myArray.value.indexOf(index) == zeroIndex - 1 ||
                  homePageNotifier.myArray.value.indexOf(index) ==
                      zeroIndex + 1 ||
                  homePageNotifier.myArray.value.indexOf(index) ==
                      zeroIndex - 3 ||
                  homePageNotifier.myArray.value.indexOf(index) ==
                      zeroIndex + 3) &&
              (zeroIndex != 3 ||
                  homePageNotifier.myArray.value.indexOf(index) != 2) &&
              ((homePageNotifier.myArray.value.indexOf(index) != 3 ||
                  zeroIndex != 2))) {
            homePageNotifier.updateArray(
                homePageNotifier.myArray.value.indexOf(index), 0);
            homePageNotifier.updateArray(zeroIndex, index);
          }
        },
        child: Container(
          width: (MediaQuery.of(context).size.width * 0.75) / 3,
          height: (MediaQuery.of(context).size.height * 0.75) / 3,
          child: Center(
              child: index != 0
                  ? Text(
                      index.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    )
                  : const SizedBox()),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.00),
              // border: Border.all(
              //   color: Colors.white,
              //   width: 3,
              // ),
              color: index == 0
                  ? Colors.transparent
                  : lastClicked == index
                      ? HexColor("#66b1f1")
                      : HexColor("#0e459c")),
        ),
      );
}
