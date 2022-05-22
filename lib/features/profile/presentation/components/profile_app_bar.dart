import 'package:flutter/material.dart';
import 'package:sputnik_test/components/buttons/icon_button_custom.dart';
import 'package:sputnik_test/statics/colors.dart';
import 'package:sputnik_test/statics/icons.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  ProfileAppBar({Key? key})
      : preferredSize = const Size.fromHeight(50),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: LibraryColors.backGround,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: IconButtonCustom(
          onTap: () {},
          icon: LibraryIcons.setting,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: IconButtonCustom(
            onTap: () {},
            icon: LibraryIcons.notification,
          ),
        ),
      ],
    );
  }
}
