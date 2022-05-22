import 'package:flutter/material.dart';

import 'package:sputnik_test/components/buttons/text_icon_button.dart';
import 'package:sputnik_test/features/profile/presentation/components/profile_app_bar.dart';
import 'package:sputnik_test/features/profile/presentation/components/profile_menu_buttons.dart';
import 'package:sputnik_test/features/profile/presentation/components/profile_user.dart';
import 'package:sputnik_test/statics/colors.dart';
import 'package:sputnik_test/statics/icons.dart';
import 'package:sputnik_test/core/entities/user_info.dart';

import 'package:sputnik_test/generated/l10n.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    required this.userInfo,
    Key? key,
  }) : super(key: key);

  final UserInfo userInfo;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(),
      backgroundColor: LibraryColors.backGround,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              ProfileUser(user: widget.userInfo),
              const ProfileMenuButtons(),
              const SizedBox(height: 22),
              TextIconButton(
                onTap: () {},
                text: S.current.viewAll,
                icon: LibraryIcons.arrowForward,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
