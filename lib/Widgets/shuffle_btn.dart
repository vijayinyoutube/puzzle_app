import 'package:flutter/material.dart';

import '../Declarations/Constants/constants.dart';
import '../ValueNotifier/homepage_notifier.dart';
import '1g_widgets.dart';

class ShuffleBtn extends StatelessWidget {
  const ShuffleBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildBtn(
        width: 175,
        child1: const Icon(
          Icons.refresh,
          color: Colors.white,
        ),
        child2: Padding(
          padding: kPadding * 1.5,
          child: const Text(
            "Shuffle",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        containerColor: secondaryColor,
        myFunction: () => homePageNotifier.setArray());
  }
}
