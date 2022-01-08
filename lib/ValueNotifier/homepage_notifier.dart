import 'package:flutter/material.dart';

class HomePageNotifier with ChangeNotifier{
  ValueNotifier<List<int>> myArray = ValueNotifier([1, 2, 3, 4, 5, 0]);
}

HomePageNotifier homePageNotifier = new HomePageNotifier();