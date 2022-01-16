import 'package:flutter/material.dart';

class HomePageNotifier with ChangeNotifier {
  ValueNotifier<List<int>> myArray = ValueNotifier([]);
  ValueNotifier<int> n = ValueNotifier(4);
  ValueNotifier<bool> isHovering = ValueNotifier(false);
  int lastClicked = 0;
  ValueNotifier<int> moves = ValueNotifier(0);
  List<int> newArray = [];

  void updateArray(int index, int value) {
    myArray.value[index] = value;
    myArray.notifyListeners();
  }

  void updateHover() {
    isHovering.value = (!isHovering.value);
    isHovering.notifyListeners();
  }

  void setArray() {
    newArray.clear();
    myArray.value.clear();
    for (var i = 1; i < (n.value * n.value); i++) {
      myArray.value.add(i);
      
      newArray.add(i);
    }
    myArray.value.shuffle();
    myArray.value.add(0);
    lastClicked = myArray.value.length;
    moves.value = 0;
    newArray.sort();
    newArray.add(0);
    myArray.notifyListeners();
  }

  void updateNVal(ValueNotifier<int> newVal) {
    n.value = newVal.value;
    n.notifyListeners();
    setArray();
    lastClicked = myArray.value.length;
    moves.value = 0;
  }

  void updateMoves() {
    moves.value += 1;
    moves.notifyListeners();
  }
}

HomePageNotifier homePageNotifier = HomePageNotifier();
