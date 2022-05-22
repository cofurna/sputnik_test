import 'package:flutter/material.dart';
import 'package:sputnik_test/components/buttons/profile_menu_button.dart';
import 'package:sputnik_test/generated/l10n.dart';
import 'package:sputnik_test/statics/assets.dart';

class ProfileMenuButtons extends StatelessWidget {
  const ProfileMenuButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProfileMenuButton(
            onTap: () {},
            text: S.current.myFollowing,
            image: LibraryAssets.lover,
          ),
          ProfileMenuButton(
            onTap: () {},
            text: S.current.myFollowers,
            image: LibraryAssets.lover,
          ),
          ProfileMenuButton(
            onTap: () {},
            text: S.current.myBadges,
            image: LibraryAssets.medal,
          ),
          ProfileMenuButton(
            onTap: () {},
            text: S.current.myOrganizatios,
            image: LibraryAssets.dollar,
          ),
        ],
      ),
    );
  }
}
