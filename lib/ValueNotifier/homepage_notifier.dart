import 'package:flutter/material.dart';

class HomePageNotifier with ChangeNotifier {
  ValueNotifier<List<int>> myArray = ValueNotifier([]);
  int n = 2;

  void updateArray(int index, int value) {
    myArray.value[index] = value;
    myArray.notifyListeners();
  }
}

HomePageNotifier homePageNotifier = HomePageNotifier();
