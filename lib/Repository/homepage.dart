import '../ValueNotifier/homepage_notifier.dart';

class HomePageRepo {
  void setArray(int count) {
    for (var i = 1; i < count; i++) {
      homePageNotifier.myArray.value.add(i);
    }
    homePageNotifier.myArray.value.shuffle();
    homePageNotifier.myArray.value.add(0);
  }

  double getPaddingSPace(int n) {
    return ((25 * n) / 3);
  }
}
