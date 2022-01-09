import 'package:flutter/material.dart';

class HomePageNotifier with ChangeNotifier {
  ValueNotifier<List<int>> myArray = ValueNotifier([1, 2, 3, 4, 5, 0]);

  void updateArray(int index, int value) {
    // this.age++;
    myArray.value[index] = value;
    myArray.notifyListeners();
  }
}

HomePageNotifier homePageNotifier = HomePageNotifier();
