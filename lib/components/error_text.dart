import 'package:flutter/material.dart';
import 'package:sputnik_test/statics/colors.dart';
import 'package:sputnik_test/statics/styles.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({required this.text, Key? key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: LibraryStyles.poppins24Medium.copyWith(color: LibraryColors.red),
      ),
    );
  }
}
