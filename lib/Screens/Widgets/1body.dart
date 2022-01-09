import 'package:flutter/material.dart';
import '../../ValueNotifier/homepage_notifier.dart';
import '2container.dart';

class BuildBodyClass extends StatelessWidget {
  const BuildBodyClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<int>>(
        valueListenable: homePageNotifier.myArray,
        builder: (context, value, _) {
          return buildBody(context);
        });
  }

  buildBody(BuildContext context) => Center(
        child: Container(
          alignment: Alignment.bottomLeft,
          width: MediaQuery.of(context).size.width * 0.75 + 2,
          height: ((MediaQuery.of(context).size.height * 0.75) / 3) *
                  (homePageNotifier.myArray.value.length / 3) +
              2,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(15.00),
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
