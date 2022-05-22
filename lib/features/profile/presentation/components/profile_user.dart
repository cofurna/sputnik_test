import 'package:flutter/material.dart';
import 'package:sputnik_test/core/entities/user_info.dart';
import 'package:sputnik_test/statics/colors.dart';
import 'package:sputnik_test/statics/styles.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({required this.user, Key? key}) : super(key: key);
  final UserInfo user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 24),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(user.avatarUrl),
            radius: 83,
          ),
          const SizedBox(height: 10),
          Text(user.name ?? user.login, style: LibraryStyles.poppins34Bold),
          Text(
            user.id.toString(),
            style: LibraryStyles.poppins17Medium
                .copyWith(color: LibraryColors.userIdGrey),
          ),
        ],
      ),
    );
  }
}
