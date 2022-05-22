import 'package:flutter/material.dart';
import 'package:sputnik_test/components/buttons/base_button.dart';
import 'package:sputnik_test/statics/colors.dart';
import 'package:sputnik_test/statics/styles.dart';

class ProfileMenuButton extends StatelessWidget with BaseButton {
  const ProfileMenuButton({
    required this.onTap,
    required this.text,
    required this.image,
    this.imageWidth = 20,
    this.textStyle,
    this.width = double.infinity,
    this.height = 58,
    Key? key,
  }) : super(key: key);

  final double imageWidth;
  final String image;
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
  Widget? get bodyWidget => Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          children: [
            Image.asset(
              image,
              width: imageWidth,
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: textStyle ?? LibraryStyles.poppins15Medium,
            )
          ],
        ),
      );

  @override
  VoidCallback? get onPressed => onTap;
  @override
  Color get pressedColor => LibraryColors.totalBlack.withOpacity(0.2);
  @override
  Color get activeColor => LibraryColors.profilMenuButton;
  @override
  List<BoxShadow>? get boxShadow => [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 20,
          offset: const Offset(0, 1),
        ),
      ];
}
