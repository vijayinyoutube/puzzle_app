import 'package:flutter/material.dart';

import '../../ValueNotifier/homepage_notifier.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print(homePageNotifier.myArray.value);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ValueListenableBuilder<List<int>>(
          valueListenable: homePageNotifier.myArray,
          builder: (context, value, _) {
            return buildBody();
          }),
    );
  }

  buildBody() => Center(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.75 + 2,
          height: ((MediaQuery.of(context).size.height * 0.75) / 3) *
                  (homePageNotifier.myArray.value.length / 3) +
              2,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(15.00),
          ),
          child: Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width * 0.75,
              height: ((MediaQuery.of(context).size.height * 0.75) / 3) *
                  (homePageNotifier.myArray.value.length / 3),
              alignment: Alignment.bottomLeft,
              child: Wrap(
                children: [
                  for (var i = 0;
                      i < homePageNotifier.myArray.value.length;
                      i++)
                    buildContainers(homePageNotifier.myArray.value[i]),
                ],
              )),
        ),
      );

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
            int zeroIndex = homePageNotifier.myArray.value.indexOf(0);
            if ((homePageNotifier.myArray.value.indexOf(index) ==
                        zeroIndex - 1 ||
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
              homePageNotifier.myArray
                  .value[homePageNotifier.myArray.value.indexOf(index)] = 0;
              homePageNotifier.myArray.value[zeroIndex] = index;
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
