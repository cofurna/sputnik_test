import 'package:flutter/material.dart';
import 'package:sputnik_test/components/buttons/base_button.dart';
import 'package:sputnik_test/statics/colors.dart';

class IconButtonCustom extends StatelessWidget with BaseButton {
  const IconButtonCustom({
    required this.onTap,
    required this.icon,
    this.width = 44,
    this.height = 44,
    this.iconSize = 15,
    this.iconColor = LibraryColors.settingNotificationIcon,
    this.buttonColor = LibraryColors.textFieldGrey,
    Key? key,
  }) : super(key: key);

  final double width;
  final double height;
  final IconData icon;
  final VoidCallback? onTap;
  final double iconSize;
  final Color iconColor;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return super.buildButton(
      width: width,
      height: height,
      key: key,
    );
  }

  @override
  Widget? get bodyWidget => Icon(
        icon,
        size: iconSize,
        color: iconColor,
      );

  @override
  VoidCallback? get onPressed => onTap;

  @override
  Color get activeColor => buttonColor;
  @override
  Color get pressedColor => LibraryColors.totalBlack.withOpacity(0.2);
  @override
  Color get disabledColor => LibraryColors.textFieldGrey.withOpacity(0.2);
  @override
  BorderRadius get borderRadius => BorderRadius.circular(20);
}
