class Insets {
  static double get xs => 4;
  static double get med => 12;
  static double get xl => 24;
  static const double maxWidth = 1300;
}

abstract class AppInsets {
  double get padding;
  double get appBarHeight;
}

class LargeInsets extends AppInsets {
  @override
  double get padding => 80;

  @override
  double get appBarHeight => 64;
}

class SmallInsets extends AppInsets {
  @override
  double get padding => 16;

  @override
  double get appBarHeight => 56;
}
