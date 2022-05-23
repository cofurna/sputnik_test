import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sputnik_test/components/buttons/gradient_icon_text_button.dart';
import 'package:sputnik_test/core/services/github_link_generator.dart';
import 'package:sputnik_test/features/home/presentation/components/divider.dart';
import 'package:sputnik_test/core/entities/user_info.dart';
import 'package:sputnik_test/statics/colors.dart';
import 'package:sputnik_test/statics/icons.dart';
import 'package:sputnik_test/statics/styles.dart';
import 'package:sputnik_test/generated/l10n.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeUserInfo extends StatelessWidget {
  const HomeUserInfo({required this.userInfo});
  final UserInfo userInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 200,
              child: AutoSizeText(
                userInfo.login,
                style: LibraryStyles.poppins34Bold,
                maxLines: 1,
              ),
            ),
            GradientIconTextButton(
              onTap: () async {
                await launchUrlString(
                  GithubLinkGenerator.gitHubUserUrl(userInfo.login),
                );
              },
              text: S.current.followOnGithub,
              icon: LibraryIcons.plusicon,
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: Text(
            '${S.current.company} ${userInfo.company}',
            style: LibraryStyles.poppins17Medium
                .copyWith(color: LibraryColors.lightGrey),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Text(
            '${S.current.email} ${userInfo.email}',
            style: LibraryStyles.poppins17Medium
                .copyWith(color: LibraryColors.lightGrey),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Text(
            '${S.current.bio} ${userInfo.bio}',
            style: LibraryStyles.poppins17Medium
                .copyWith(color: LibraryColors.lightGrey),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 17),
        const DividerLine(),
      ],
    );
  }
}
