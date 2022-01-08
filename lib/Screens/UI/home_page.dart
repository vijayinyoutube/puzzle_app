import 'package:flutter/material.dart';

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
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.75 + 2,
            height: ((MediaQuery.of(context).size.height * 0.75) / 3) *
                    (myArray.length / 3) +
                2,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(15.00),
            ),
            child: Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width * 0.75,
                height: ((MediaQuery.of(context).size.height * 0.75) / 3) *
                    (myArray.length / 3),
                alignment: Alignment.bottomLeft,
                child: Wrap(
                  children: [
                    for (var i = 0; i < myArray.length; i++)
                      buildContainers(myArray[i]),
                  ],
                )),
          ),
        ));
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
        return buildColorContainer(value, Colors.transparent);
    }
  }

  Widget buildColorContainer(int index, Color myColor) => GestureDetector(
        onTap: () {
          setState(() {
            int zeroIndex = myArray.indexOf(0);
            if ((myArray.indexOf(index) == zeroIndex - 1 ||
                    myArray.indexOf(index) == zeroIndex + 1 ||
                    myArray.indexOf(index) == zeroIndex - 3 ||
                    myArray.indexOf(index) == zeroIndex + 3) &&
                (zeroIndex != 3 || myArray.indexOf(index) != 2)) {
              myArray[myArray.indexOf(index)] = 0;
              myArray[zeroIndex] = index;
            }
          });
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
            color: myColor,
          ),
        ),
      );
}
