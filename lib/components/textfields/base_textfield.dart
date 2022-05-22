import 'package:flutter/material.dart';
import 'package:sputnik_test/statics/colors.dart';

mixin BaseTextfield {
  Widget buildtextfield({
    Key? key,
  }) =>
      Stack(
        children: [
          TextField(
            textAlignVertical: TextAlignVertical.bottom,
            style: textStyle,
            controller: textEditingController,
            decoration: InputDecoration(
              filled: true,
              fillColor: LibraryColors.textFieldGrey,
              border: outlineInputBorder,
              focusedBorder: outlineInputBorder,
              enabledBorder: outlineInputBorder,
              disabledBorder: outlineInputBorder,
              hintText: hintText,
              hintStyle: hintStyle,
              suffix: suffix,
              contentPadding: contentPadding,
            ),
          ),
          Padding(
            padding: labelPadding,
            child: Text(
              label,
              style: labelStyle,
            ),
          ),
        ],
      );

  //Optional fields
  Widget? get suffix => null;
  EdgeInsetsGeometry? get contentPadding => null;
  EdgeInsetsGeometry get labelPadding => const EdgeInsets.only(
        left: 15,
        top: 8,
      );
  OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: const BorderSide(
          width: 0,
          color: Colors.transparent,
        ),
      );

  //Required fields
  String get label => throw UnimplementedError();
  String get hintText => throw UnimplementedError();
  TextStyle get hintStyle => throw UnimplementedError();
  TextStyle get textStyle => throw UnimplementedError();
  TextStyle get labelStyle => throw UnimplementedError();
  TextEditingController get textEditingController => throw UnimplementedError();
  BorderRadius get borderRadius => throw UnimplementedError();
}
