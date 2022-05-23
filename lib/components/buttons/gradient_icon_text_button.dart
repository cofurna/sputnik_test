import 'package:flutter/material.dart';
import 'package:sputnik_test/components/buttons/base_button.dart';
import 'package:sputnik_test/statics/colors.dart';
import 'package:sputnik_test/statics/styles.dart';

class GradientIconTextButton extends StatelessWidget with BaseButton {
  const GradientIconTextButton({
    required this.onTap,
    required this.text,
    required this.icon,
    this.textStyle,
    this.width = 116,
    this.height = 42,
    this.iconSize = 8,
    this.iconColor = LibraryColors.white,
    Key? key,
  }) : super(key: key);

  final double width;
  final double height;
  final String text;
  final IconData icon;
  final VoidCallback? onTap;
  final TextStyle? textStyle;
  final double iconSize;
  final Color? iconColor;

  double get space => 10;

  @override
  Widget build(BuildContext context) {
    return super.buildButton(
      width: width,
      height: height,
      key: key,
    );
  }

  @override
  Gradient? get gradient => const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          LibraryColors.darkOrange,
          LibraryColors.lightOrange,
        ],
      );
  @override
  Widget? get bodyWidget => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
            Text(
              text,
              style: textStyle ??
                  LibraryStyles.poppins10Bold.copyWith(
                    color: LibraryColors.white,
                  ),
              maxLines: 1,
            ),
          ],
        ),
      );

  @override
  VoidCallback? get onPressed => onTap;
  @override
  Color get pressedColor => LibraryColors.white.withOpacity(0.2);
  @override
  Color get disabledColor => LibraryColors.buttonGrey;
  @override
  BorderRadius get borderRadius => BorderRadius.circular(10);
}
