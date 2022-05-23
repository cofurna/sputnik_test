import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sputnik_test/features/following/presentation/bloc/following_bloc.dart';

import 'package:sputnik_test/features/following/presentation/following_list.dart';
import 'package:sputnik_test/features/repositories/presentation/bloc/repo_bloc.dart';
import 'package:sputnik_test/features/repositories/presentation/repo_list.dart';
import 'package:sputnik_test/features/home/presentation/components/home_user_info.dart';
import 'package:sputnik_test/core/entities/user_info.dart';
import 'package:sputnik_test/statics/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required this.userInfo, Key? key}) : super(key: key);

  final UserInfo userInfo;

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
                child: HomeUserInfo(userInfo: userInfo),
              ),
              const SizedBox(
                height: 10,
              ),
              BlocProvider(
                create: (_) => FollowingBloc(),
                child: FollowingList(
                  user: userInfo,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              BlocProvider(
                create: (_) => RepoBloc(),
                child: RepoList(
                  user: userInfo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
