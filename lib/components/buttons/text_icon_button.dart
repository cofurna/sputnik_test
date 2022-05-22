import 'package:flutter/material.dart';
import 'package:sputnik_test/components/buttons/base_button.dart';
import 'package:sputnik_test/statics/colors.dart';
import 'package:sputnik_test/statics/styles.dart';

class TextIconButton extends StatelessWidget with BaseButton {
  const TextIconButton(
      {required this.onTap,
      required this.text,
      required this.icon,
      this.textStyle,
      this.width = double.infinity,
      this.height = 58,
      this.iconSize = 17,
      this.iconColor = LibraryColors.white,
      Key? key})
      : super(key: key);
  final double width;
  final double height;
  final String text;
  final IconData icon;
  final VoidCallback? onTap;
  final TextStyle? textStyle;
  final double? iconSize;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return super.buildButton(
      width: width,
      height: height,
      key: key,
    );
  }

  @override
  Widget? get bodyWidget => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: textStyle ??
                LibraryStyles.poppins17Bold.copyWith(
                  color: LibraryColors.white,
                ),
          ),
          const SizedBox(width: 14),
          Icon(
            icon,
            size: iconSize,
            color: iconColor,
          ),
        ],
      );

  @override
  VoidCallback? get onPressed => onTap;
  @override
  Color get pressedColor => LibraryColors.white.withOpacity(0.2);
  @override
  Color get activeColor => LibraryColors.mainGreyColor;
}
