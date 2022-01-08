import 'dart:math';

import 'package:flutter/material.dart';
import 'package:puzzle_app/main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> myArray = [1, 2, 3, 4, 5, 0];
  @override
  Widget build(BuildContext context) {
    print(myArray);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
            color: Colors.lightBlue,
            width: MediaQuery.of(context).size.width * 0.75,
            height: ((MediaQuery.of(context).size.width * 0.75) / 3) *(myArray.length / 3),
            alignment: Alignment.bottomLeft,
            child: Wrap(
              children: [
                for (var i = 0; i < myArray.length; i++)
                  buildContainers(myArray[i]),
              ],
            )),
      ),
    );
  }

  Widget buildColorContainer(int index, Color myColor) => GestureDetector(
        onTap: () {
          print(index);
          setState(() {
            int zeroIndex = findZero();
            print("Zero is at:$zeroIndex");

            // int temp = index;
            // int arrayValue = myArray[index];

            print("Container Clicked:$index");
            myArray[myArray.indexOf(index)] = 0;

            myArray[zeroIndex] = index;
            // myArray = [myArray[0], myArray[1], myArray[2], myArray[3]];
            print(myArray);
          });
        },
        child: Container(
          color: myColor,
          width: (MediaQuery.of(context).size.width * 0.75) / 3,
          height: (MediaQuery.of(context).size.width * 0.75) / 3,
        ),
      );
  Widget buildWhiteContainer() => Container(
        color: Colors.white,
        width: (MediaQuery.of(context).size.width * 0.75) / 3,
        height: (MediaQuery.of(context).size.width * 0.75) / 3,
      );

  findZero() {
    for (var i = 0; i < myArray.length; i++) {
      if (myArray[i] == 0) {
        return i;
      }
    }
  }

  buildContainers(int value) {
    switch (value) {
      case 1:
        return buildColorContainer(value, Colors.red);
      case 2:
        return buildColorContainer(value, Colors.blue);
      case 3:
        return buildColorContainer(value, Colors.green);
      case 4:
        return buildColorContainer(value, Colors.indigo);
      case 5:
        return buildColorContainer(value, Colors.pink);
      case 0:
        return buildColorContainer(value, Colors.white);
    }
  }
}
