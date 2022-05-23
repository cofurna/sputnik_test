import 'package:flutter/material.dart';
import 'package:sputnik_test/statics/assets.dart';
import 'package:sputnik_test/statics/colors.dart';
import 'package:sputnik_test/statics/styles.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({required this.text, Key? key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: [
          Image.asset(
            LibraryAssets.userNotFound,
            height: 65,
            filterQuality: FilterQuality.high,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: LibraryStyles.poppins24Medium
                .copyWith(color: LibraryColors.red),
          ),
        ],
      ),
    );
  }
}
