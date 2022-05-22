import 'package:flutter/material.dart';
import 'package:sputnik_test/statics/colors.dart';

class DividerLine extends StatelessWidget {
  const DividerLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1.5,
      color: LibraryColors.dividerLine,
    );
  }
}
