import 'package:flutter/material.dart';
import 'package:sputnik_test/components/buttons/base_button.dart';
import 'package:sputnik_test/statics/colors.dart';
import 'package:sputnik_test/statics/styles.dart';

class GradientTextButton extends StatelessWidget with BaseButton {
  const GradientTextButton({
    required this.onTap,
    required this.text,
    this.textStyle,
    this.width = double.infinity,
    this.height = 58,
    Key? key,
  }) : super(key: key);

  final double width;
  final double height;
  final String text;
  final VoidCallback? onTap;
  final TextStyle? textStyle;

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
  Widget? get bodyWidget => Text(
        text,
        style: textStyle ??
            LibraryStyles.poppins17Bold.copyWith(
              color: LibraryColors.white,
            ),
      );

  @override
  VoidCallback? get onPressed => onTap;
  @override
  Color get pressedColor => LibraryColors.white.withOpacity(0.2);
  @override
  Color get disabledColor => LibraryColors.buttonGrey;
}
