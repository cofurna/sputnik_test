import 'package:flutter/cupertino.dart';
import 'package:sputnik_test/components/buttons/base_button.dart';
import 'package:sputnik_test/statics/colors.dart';
import 'package:sputnik_test/statics/styles.dart';

class TextButtonCustom extends StatelessWidget with BaseButton {
  const TextButtonCustom({
    required this.onTap,
    required this.text,
    this.textStyle,
    this.width = 60,
    this.height = 20,
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
  Widget? get bodyWidget => Text(
        text,
        style: textStyle ??
            LibraryStyles.poppins15Normal.copyWith(
              decoration: TextDecoration.underline,
            ),
      );

  @override
  VoidCallback? get onPressed => onTap;
  @override
  Color get pressedColor => LibraryColors.white;
  @override
  Color get disabledColor => LibraryColors.buttonGrey;
  @override
  Color get activeColor => LibraryColors.transparent;
}
