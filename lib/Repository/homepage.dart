import '../ValueNotifier/homepage_notifier.dart';

class HomePageRepo {
  void setArray(int count) {
    for (var i = 1; i < count; i++) {
      homePageNotifier.myArray.value.add(i);
    }
    homePageNotifier.myArray.value.add(0);
  }

  double getPaddingSPace(int n) {
    return ((25 * n) / 3);
  }

  isMultipleofN(int n) {
    int temp = ((n +1) % homePageNotifier.n).floor();
    print(temp);
    return temp == 0 ? false : true;
  }
}
