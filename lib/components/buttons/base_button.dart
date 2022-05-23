import 'package:flutter/material.dart';

mixin BaseButton {
  Widget buildButton({
    required double width,
    required double height,
    Key? key,
  }) =>
      Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: onPressed == null ? null : gradient,
              borderRadius: borderRadius,
              color: getButtonColor,
              boxShadow: boxShadow,
            ),
            child: Center(child: bodyWidget),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: pressedColor.withOpacity(.2),
              highlightColor: pressedColor.withOpacity(.1),
              borderRadius: borderRadius,
              onTap: onPressed,
              child: Container(
                width: width,
                height: height,
              ),
            ),
          ),
        ],
      );

  Color? get getButtonColor {
    if (onPressed == null) {
      return disabledColor;
    }
    if (gradient != null) {
      return null;
    }
    if (onPressed != null) {
      return activeColor;
    }
    return activeColor;
  }

  //Optional fields
  Gradient? get gradient => null;
  BorderRadius get borderRadius => BorderRadius.circular(14);
  VoidCallback? get onPressed => null;
  List<BoxShadow>? get boxShadow => null;

  //Required fields
  Widget? get bodyWidget => throw UnimplementedError();
  Color get activeColor => throw UnimplementedError();
  Color get pressedColor => throw UnimplementedError();
  Color get disabledColor => throw UnimplementedError();
}
