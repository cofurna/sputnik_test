import 'package:flutter/material.dart';
import 'package:sputnik_test/components/buttons/base_button.dart';
import 'package:sputnik_test/statics/colors.dart';
import 'package:sputnik_test/statics/styles.dart';

class NavBarButton extends StatelessWidget with BaseButton {
  const NavBarButton({
    required this.isActive,
    required this.onTap,
    required this.title,
    required this.icon,
    required this.hasNotification,
    this.width = 49,
    this.height = 39,
    this.iconSize = 20,
    Key? key,
  }) : super(key: key);

  final bool isActive;
  final String title;
  final IconData icon;
  final bool hasNotification;
  final double width;
  final double height;
  final double iconSize;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return super.buildButton(
      width: width,
      height: height,
      key: key,
    );
  }

  @override
  Widget? get bodyWidget => Column(
        children: [
          Icon(
            icon,
            size: iconSize,
            color: isActive
                ? LibraryColors.mainGreyColor
                : LibraryColors.labelGrey,
          ),
          Text(
            title,
            style: LibraryStyles.poppins10Bold.copyWith(
              color: isActive
                  ? LibraryColors.mainGreyColor
                  : LibraryColors.labelGrey,
            ),
          ),
        ],
      );

  @override
  VoidCallback? get onPressed => onTap;
  @override
  Color get pressedColor => LibraryColors.white.withOpacity(0.2);
  @override
  Color get activeColor => LibraryColors.backGround;
}
