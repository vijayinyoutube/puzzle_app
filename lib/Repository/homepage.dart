class HomePageRepo {
  
  Map<int, String> levels = {
    3: 'Beginner',
    4: 'Intermediate',
    5: 'Advanced'
  };




  double getPaddingSPace(int n) {
    return ((25 * n) / 3);
  }
}
