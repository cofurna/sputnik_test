import 'package:flutter/cupertino.dart';

class Scaler {
  static const double carouselScale = 0.65;

  static double getMainScale(BuildContext context) {
    return getEmptySize(context) / 812;
  }

  static double getEmptySize(BuildContext context) {
    return MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top;
  }
}
