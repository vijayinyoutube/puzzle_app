import 'package:flutter/material.dart';

import '../ValueNotifier/homepage_notifier.dart';

class HomePageRepo with ChangeNotifier {
  void setArray() {
    homePageNotifier.myArray.value.clear();
    for (var i = 1; i < (homePageNotifier.n * homePageNotifier.n); i++) {
      homePageNotifier.myArray.value.add(i);
    }
    homePageNotifier.myArray.value.shuffle();
    homePageNotifier.myArray.value.add(0);
    homePageNotifier.myArray.notifyListeners();
  }

  double getPaddingSPace(int n) {
    return ((25 * n) / 3);
  }
}
