import 'package:flutter/material.dart';
import 'package:sputnik_test/statics/colors.dart';

class FollowerDividerLine extends StatelessWidget {
  const FollowerDividerLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      thickness: 1,
      color: LibraryColors.followersDividerLine,
    );
  }
}
