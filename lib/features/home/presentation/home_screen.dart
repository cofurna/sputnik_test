import 'package:flutter/material.dart';

import 'package:sputnik_test/features/home/presentation/components/home_following.dart';
import 'package:sputnik_test/features/home/presentation/components/home_repositories.dart';
import 'package:sputnik_test/features/home/presentation/components/home_user_info.dart';
import 'package:sputnik_test/core/entities/user_info.dart';
import 'package:sputnik_test/statics/colors.dart';

class FollowingInfo {
  const FollowingInfo({
    required this.id,
    required this.login,
    required this.urlAvatar,
  });
  final String id;
  final String login;
  final String urlAvatar;
}

class RepoInfo {
  const RepoInfo({
    required this.id,
    required this.forksCount,
    required this.stargazersCount,
    required this.name,
    required this.language,
  });
  final String id;
  final int forksCount;
  final int stargazersCount;
  final String name;
  final String language;
}

class HomeScreenData {
  const HomeScreenData({
    required this.followingList,
    required this.repoList,
  });

  final List<FollowingInfo> followingList;
  final List<RepoInfo> repoList;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.userInfo, Key? key}) : super(key: key);

  final UserInfo userInfo;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenData get data => const HomeScreenData(
        followingList: [
          FollowingInfo(
              id: '4466',
              login: 'CristoanDD',
              urlAvatar: 'https://avatars.githubusercontent.com/u/982?v=4'),
          FollowingInfo(
              id: '3567',
              login: 'login',
              urlAvatar: 'https://avatars.githubusercontent.com/u/982?v=4'),
          FollowingInfo(
              id: '1287667',
              login: 'login',
              urlAvatar: 'https://avatars.githubusercontent.com/u/982?v=4'),
        ],
        repoList: [
          RepoInfo(
            id: 'id',
            forksCount: 5,
            stargazersCount: 5,
            name: '5thGallery',
            language: 'Dart',
          ),
          RepoInfo(
            id: 'id',
            forksCount: 54,
            stargazersCount: 53,
            name: '5thGallery',
            language: 'Java Script',
          ),
          RepoInfo(
            id: 'id',
            forksCount: 4,
            stargazersCount: 223,
            name: '5thGallery',
            language: 'Ruby',
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LibraryColors.backGround,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: HomeUserInfo(userInfo: widget.userInfo),
              ),
              const SizedBox(
                height: 10,
              ),
              HomeFollowing(followingList: data.followingList),
              const SizedBox(
                height: 14,
              ),
              HomeRepositories(repoList: data.repoList),
            ],
          ),
        ),
      ),
    );
  }
}
