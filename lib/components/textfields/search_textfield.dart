import 'package:flutter/material.dart';
import 'package:sputnik_test/components/buttons/icon_button_custom.dart';
import 'package:sputnik_test/components/textfields/base_textfield.dart';
import 'package:sputnik_test/generated/l10n.dart';
import 'package:sputnik_test/statics/colors.dart';

import 'package:sputnik_test/statics/styles.dart';

class SearchTextfield extends StatelessWidget with BaseTextfield {
  const SearchTextfield({required this.controller, Key? key}) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return super.buildtextfield(
      key: key,
    );
  }

  @override
  BorderRadius get borderRadius => BorderRadius.circular(10);

  @override
  String get hintText => '${S.current.search}${S.current.dots}';

  @override
  TextStyle get hintStyle => LibraryStyles.poppins17Normal
      .copyWith(color: LibraryColors.secondaryLightGrey);

  @override
  TextStyle get textStyle => LibraryStyles.poppins17Normal
      .copyWith(color: LibraryColors.mainGreyColor);

  @override
  TextEditingController get textEditingController => controller;

  @override
  Widget get suffix => Padding(
        padding: const EdgeInsets.all(9),
        child: IconButtonCustom(
          onTap: () {},
          icon: Icons.tune,
          iconSize: 24,
          width: 28,
          height: 28,
          iconColor: LibraryColors.secondaryLightGrey,
          buttonColor: LibraryColors.transparent,
        ),
      );

  @override
  EdgeInsetsGeometry get contentPadding => const EdgeInsets.only(
        top: 9,
        left: 14,
        bottom: 9,
      );
}
