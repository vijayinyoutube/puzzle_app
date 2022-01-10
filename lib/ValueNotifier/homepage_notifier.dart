import 'package:flutter/material.dart';

class HomePageNotifier with ChangeNotifier {
  ValueNotifier<List<int>> myArray = ValueNotifier([]);
  ValueNotifier<int> n = ValueNotifier(4);
  ValueNotifier<bool> isHovering = ValueNotifier(false);

  void updateArray(int index, int value) {
    myArray.value[index] = value;
    myArray.notifyListeners();
  }

  void updateHover() {
    isHovering.value = (!isHovering.value);
    isHovering.notifyListeners();
  }

  void setArray() {
    myArray.value.clear();
    for (var i = 1; i < (n.value * n.value); i++) {
      myArray.value.add(i);
    }
    myArray.value.shuffle();
    myArray.value.add(0);
    myArray.notifyListeners();
  }

  void updateNVal(ValueNotifier<int> newVal) {
    print("entered");
    n.value = newVal.value;
    n.notifyListeners();
    setArray();
    myArray.notifyListeners();
  }
}

HomePageNotifier homePageNotifier = HomePageNotifier();
