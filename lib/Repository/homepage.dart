class HomePageRepo {
  Map<int, String> levels = {
    2: 'Beginner',
    3: 'Intermediate',
    4: 'Advanced',
    5: 'Pro'
  };

  String defaultLevel = "Intermediate";

  double getPaddingSPace(int n) {
    return ((25 * n) / 3);
  }
}
