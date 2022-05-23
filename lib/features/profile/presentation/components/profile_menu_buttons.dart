import 'package:flutter/material.dart';
import 'package:sputnik_test/components/buttons/profile_menu_button.dart';
import 'package:sputnik_test/core/services/github_link_generator.dart';
import 'package:sputnik_test/generated/l10n.dart';
import 'package:sputnik_test/statics/assets.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProfileMenuButtons extends StatelessWidget {
  const ProfileMenuButtons({required this.login, Key? key}) : super(key: key);
  final String login;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProfileMenuButton(
            onTap: () async {
              await launchUrlString(
                GithubLinkGenerator.gitHubUserFollowingUrl(login),
              );
            },
            text: S.current.myFollowing,
            image: LibraryAssets.lover,
          ),
          ProfileMenuButton(
            onTap: () async {
              await launchUrlString(
                GithubLinkGenerator.gitHubUserFollowersUrl(login),
              );
            },
            text: S.current.myFollowers,
            image: LibraryAssets.lover,
          ),
          ProfileMenuButton(
            onTap: () async {
              await launchUrlString(
                GithubLinkGenerator.gitHubUserUrl(login),
              );
            },
            text: S.current.myBadges,
            image: LibraryAssets.medal,
          ),
          ProfileMenuButton(
            onTap: () async {
              await launchUrlString(
                GithubLinkGenerator.gitHubUserUrl(login),
              );
            },
            text: S.current.myOrganizatios,
            image: LibraryAssets.dollar,
          ),
        ],
      ),
    );
  }
}
