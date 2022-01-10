import 'package:flutter/material.dart';

class HomePageNotifier with ChangeNotifier {
  ValueNotifier<List<int>> myArray = ValueNotifier([]);
  int n = 3;
  ValueNotifier<bool> isHovering = ValueNotifier(false);

  void updateArray(int index, int value) {
    myArray.value[index] = value;
    myArray.notifyListeners();
  }

  void updateHover() {
    isHovering.value = (!isHovering.value);
    isHovering.notifyListeners();
  }
}

HomePageNotifier homePageNotifier = HomePageNotifier();
