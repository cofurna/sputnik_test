import 'package:flutter/material.dart';
import 'package:sputnik_test/statics/colors.dart';
import 'package:sputnik_test/statics/styles.dart';
import 'package:sputnik_test/generated/l10n.dart';

class Agreement extends StatelessWidget {
  const Agreement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: S.current.agreeWith,
              style: LibraryStyles.poppins13Medium
                  .copyWith(color: LibraryColors.lightGrey),
            ),
            TextSpan(
              text: S.current.terms,
              style: LibraryStyles.poppins13Medium,
            ),
            TextSpan(
              text: S.current.and,
              style: LibraryStyles.poppins13Medium
                  .copyWith(color: LibraryColors.lightGrey),
            ),
            TextSpan(
              text: S.current.privacyPolicy,
              style: LibraryStyles.poppins13Medium,
            ),
          ],
        ),
      ),
    );
  }
}
