import 'package:flutter/material.dart';

import '../../ValueNotifier/homepage_notifier.dart';
import 'package:hexcolor/hexcolor.dart';

class BuildContainerClass extends StatelessWidget {
  const BuildContainerClass({Key? key, required this.value}) : super(key: key);

  final int value;
  static int zeroIndex = homePageNotifier.myArray.value.indexOf(0);
  static int lastClicked = 0;
  static int hoverIndex = 0;
  static Color hoverColor = HexColor("#0e459c");

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: homePageNotifier.isHovering,
        builder: (context, values, _) {
          return buildColorContainer(value, context);
        });
  }

  Widget buildColorContainer(int index, BuildContext context) => Padding(
        padding: const EdgeInsets.all(2.0),
        child: MouseRegion(
          onEnter: (PointerEvent event) {
            homePageNotifier.updateHover();
            hoverIndex = index;
            print("object");
          },
          onExit: (PointerEvent event) {
            homePageNotifier.updateHover();
            hoverIndex = homePageNotifier.myArray.value.indexOf(0);
          },
          child: GestureDetector(
            onTap: () {
              zeroIndex = homePageNotifier.myArray.value.indexOf(0);

              if (isAdjacent(index) && isNotDiagonallyOpposite(index)) {
                lastClicked = index;
                homePageNotifier.updateArray(
                    homePageNotifier.myArray.value.indexOf(index), 0);
                homePageNotifier.updateArray(zeroIndex, index);
              }
            },
            child: Container(
              width: 100,
              height: 100,
              child: Center(
                  child: index != 0
                      ? Text(
                          index.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30),
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
                          : homePageNotifier.isHovering.value &&
                                  hoverIndex == index
                              ? hoverColor
                              : HexColor("#0468d7")),
            ),
          ),
        ),
      );

  isAdjacent(int index) {
    // print((homePageNotifier.myArray.value.indexOf(index) == zeroIndex - 1 ||
    //     homePageNotifier.myArray.value.indexOf(index) == zeroIndex + 1 ||
    //     homePageNotifier.myArray.value.indexOf(index) ==
    //         zeroIndex - homePageNotifier.n ||
    //     homePageNotifier.myArray.value.indexOf(index) ==
    //         zeroIndex + homePageNotifier.n));
    return (homePageNotifier.myArray.value.indexOf(index) == zeroIndex - 1 ||
        homePageNotifier.myArray.value.indexOf(index) == zeroIndex + 1 ||
        homePageNotifier.myArray.value.indexOf(index) ==
            zeroIndex - homePageNotifier.n ||
        homePageNotifier.myArray.value.indexOf(index) ==
            zeroIndex + homePageNotifier.n);
  }

  isNotDiagonallyOpposite(int index) {
    // print(((zeroIndex % (homePageNotifier.n) != 0 ||
    //         (homePageNotifier.myArray.value.indexOf(index) + 1) %
    //                 (homePageNotifier.n) !=
    //             0) &&
    //     ((homePageNotifier.myArray.value.indexOf(index) %
    //                 (homePageNotifier.n) !=
    //             0 ||
    //         (zeroIndex + 1) % (homePageNotifier.n) != 0))));

    return homePageNotifier.n != 2
        ? ((zeroIndex % (homePageNotifier.n) != 0 ||
                (homePageNotifier.myArray.value.indexOf(index) + 1) %
                        (homePageNotifier.n) !=
                    0) &&
            ((homePageNotifier.myArray.value.indexOf(index) %
                        (homePageNotifier.n) !=
                    0 ||
                (zeroIndex + 1) % (homePageNotifier.n) != 0)))
        : ((zeroIndex != 2 ||
                homePageNotifier.myArray.value.indexOf(index) + 1 != 2) &&
            (zeroIndex != 1 ||
                homePageNotifier.myArray.value.indexOf(index) != 2));
  }

  // isDiagonallyOpposite2(int index) {
  //   print(((zeroIndex % (homePageNotifier.n) != 0 ||
  //           (homePageNotifier.myArray.value.indexOf(index) + 1) %
  //                   (homePageNotifier.n) !=
  //               0) &&
  //       ((homePageNotifier.myArray.value.indexOf(index) %
  //                   (homePageNotifier.n) !=
  //               0 ||
  //           (zeroIndex + 1) % (homePageNotifier.n) != 0))));

  //   return ((zeroIndex != 2 ||
  //           homePageNotifier.myArray.value.indexOf(index) + 1 != 2) &&
  //       (zeroIndex != 1 || homePageNotifier.myArray.value.indexOf(index) != 2));
  // }
}
