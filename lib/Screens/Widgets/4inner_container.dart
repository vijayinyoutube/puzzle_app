import 'package:flutter/material.dart';

import '../../Constants/constants.dart';
import '../../ValueNotifier/homepage_notifier.dart';

class BuildContainerClass extends StatelessWidget {
  const BuildContainerClass({Key? key, required this.value}) : super(key: key);

  final int value;
  static int zeroIndex = homePageNotifier.myArray.value.indexOf(0);
  
  static int hoverIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: homePageNotifier.isHovering,
        builder: (context, values, _) {
          return buildColorContainer(value, context);
        });
  }

  Widget buildColorContainer(int index, BuildContext context) => Padding(
        padding: kPadding / 5,
        child: MouseRegion(
          onEnter: (PointerEvent event) {
            homePageNotifier.updateHover();
            hoverIndex = index;
          },
          onExit: (PointerEvent event) {
            homePageNotifier.updateHover();
          },
          child: GestureDetector(
            onTap: () {
              zeroIndex = homePageNotifier.myArray.value.indexOf(0);

              if (isAdjacent(index) && isNotDiagonallyOpposite(index)) {
                homePageNotifier.lastClicked = index;
                homePageNotifier.updateArray(
                    homePageNotifier.myArray.value.indexOf(index), 0);
                homePageNotifier.updateArray(zeroIndex, index);
              }
//               else if(((zeroIndex-homePageNotifier.myArray.value.indexOf(index)==6)|| (zeroIndex-homePageNotifier.myArray.value.indexOf(index)==-6)&&(zeroIndex<homePageNotifier.n))){
//                 print("INSIDE");
//                 int temp=homePageNotifier.myArray.value[zeroIndex];
//                 print(temp);
//                 var mid=0;
//                 var i=0;

//                 for( i=0;i<homePageNotifier.myArray.value.indexOf(index);i++)
//                 {
//                   if(homePageNotifier.myArray.value.indexOf(index)-homePageNotifier.myArray.value[i]==homePageNotifier.n){
//                   print("Ci = ${((index))}");
//                   print("a[i] =  ${([i])}");
//                      mid=homePageNotifier.myArray.value[i];
//                      print("mid $mid");

//                   }
//                 }
//                  homePageNotifier.updateArray(homePageNotifier.myArray.value.indexOf(zeroIndex), mid);
//                      homePageNotifier.updateArray(homePageNotifier.myArray.value.indexOf(i), homePageNotifier.myArray.value.indexOf(index));
//  homePageNotifier.updateArray(homePageNotifier.myArray.value.indexOf(homePageNotifier.myArray.value.indexOf(index)), temp);

// // homePageNotifier.myArray.value[zeroIndex]=mid;
// // homePageNotifier.myArray.value[i]=homePageNotifier.myArray.value.indexOf(index);
// // homePageNotifier.myArray.value[homePageNotifier.myArray.value.indexOf(index)]=temp;

//               }
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
                  borderRadius: kBorder,
                  color: index == 0
                      ? Colors.transparent
                      : homePageNotifier.lastClicked == index
                          ? secondaryColor
                          : homePageNotifier.isHovering.value &&
                                  hoverIndex == index
                              ? hoverColor
                              : primaryColor),
            ),
          ),
        ),
      );

  isAdjacent(int index) {
    return (homePageNotifier.myArray.value.indexOf(index) == zeroIndex - 1 ||
        homePageNotifier.myArray.value.indexOf(index) == zeroIndex + 1 ||
        homePageNotifier.myArray.value.indexOf(index) ==
            zeroIndex - homePageNotifier.n.value ||
        homePageNotifier.myArray.value.indexOf(index) ==
            zeroIndex + homePageNotifier.n.value);
  }

  isNotDiagonallyOpposite(int index) {
    return homePageNotifier.n.value != 2
        ? ((zeroIndex % (homePageNotifier.n.value) != 0 ||
                (homePageNotifier.myArray.value.indexOf(index) + 1) %
                        (homePageNotifier.n.value) !=
                    0) &&
            ((homePageNotifier.myArray.value.indexOf(index) %
                        (homePageNotifier.n.value) !=
                    0 ||
                (zeroIndex + 1) % (homePageNotifier.n.value) != 0)))
        : ((zeroIndex != 2 ||
                homePageNotifier.myArray.value.indexOf(index) + 1 != 2) &&
            (zeroIndex != 1 ||
                homePageNotifier.myArray.value.indexOf(index) != 2));
  }
}
