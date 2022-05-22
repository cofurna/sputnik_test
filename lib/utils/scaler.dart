import 'package:flutter/cupertino.dart';

class Scaler {
  static const double carouselScale = 0.65;

  static const double designHeight = 812;
  static const double designWidth = 375;

  static double getMainScaleHeight(BuildContext context) {
    return getEmptySizeHeight(context) / designHeight;
  }

  static double getEmptySizeHeight(BuildContext context) {
    return MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top;
  }

  static double getMainScaleWidth(BuildContext context) {
    return MediaQuery.of(context).size.width / designWidth;
  }
}
