import 'package:flutter/material.dart';

class HomePageNotifier with ChangeNotifier {
  ValueNotifier<List<int>> myArray = ValueNotifier([]);
  ValueNotifier<int> n = ValueNotifier(4);
  ValueNotifier<bool> isHovering = ValueNotifier(false);
  int lastClicked = 0;
  ValueNotifier<int> moves = ValueNotifier(0);

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
    lastClicked = myArray.value.length;
    moves.value = 0;
    myArray.notifyListeners();
  }

  void updateNVal(ValueNotifier<int> newVal) {
    n.value = newVal.value;
    n.notifyListeners();
    setArray();
    lastClicked = myArray.value.length;
    moves.value = 0;
    myArray.notifyListeners();
  }

  void updateMoves() {
    moves.value += 1;
    moves.notifyListeners();
  }
}

HomePageNotifier homePageNotifier = HomePageNotifier();
