import 'package:flutter/material.dart';
import 'package:sputnik_test/components/textfields/base_textfield.dart';
import 'package:sputnik_test/statics/colors.dart';
import 'package:sputnik_test/statics/styles.dart';
import 'package:sputnik_test/generated/l10n.dart';

class NicknameTextfield extends StatelessWidget with BaseTextfield {
  const NicknameTextfield({required this.controller, Key? key})
      : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return super.buildtextfield(
      key: key,
    );
  }

  @override
  BorderRadius get borderRadius => BorderRadius.circular(16);

  @override
  String get hintText => S.current.enterNickname;

  @override
  TextStyle get hintStyle =>
      LibraryStyles.poppins36Medium.copyWith(color: LibraryColors.lightGrey);

  @override
  TextStyle get textStyle => LibraryStyles.poppins36Medium
      .copyWith(color: LibraryColors.mainGreyColor);

  @override
  TextEditingController get textEditingController => controller;

  @override
  String get label => S.current.nickname;

  @override
  TextStyle get labelStyle =>
      LibraryStyles.poppins10Medium.copyWith(color: LibraryColors.labelGrey);

  @override
  EdgeInsetsGeometry get contentPadding => const EdgeInsets.only(
        top: 36,
        left: 15,
        bottom: 12,
      );
}
