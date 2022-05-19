import 'package:flutter/cupertino.dart';

class Scaler {
  static const double carouselScale = 0.65;

  static double getEmptySize(BuildContext context) {
    return MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top;
  }
}
