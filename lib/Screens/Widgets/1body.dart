import 'package:flutter/material.dart';
import '../../Repository/homepage.dart';
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
          alignment: Alignment.center,
          width: (100*homePageNotifier.n.toDouble()+HomePageRepo().getPaddingSPace(homePageNotifier.n)),
          height: (100*homePageNotifier.n.toDouble()+HomePageRepo().getPaddingSPace(homePageNotifier.n)),
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
