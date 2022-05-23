import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sputnik_test/components/textfields/search_textfield.dart';
import 'package:sputnik_test/core/entities/user_info.dart';
import 'package:sputnik_test/features/followers/presentation/bloc/bloc/followers_bloc.dart';

import 'package:sputnik_test/features/followers/presentation/components/followers_list.dart';
import 'package:sputnik_test/generated/l10n.dart';
import 'package:sputnik_test/statics/styles.dart';

class FollowersScreen extends StatefulWidget {
  const FollowersScreen({required this.userInfo, Key? key}) : super(key: key);
  final UserInfo userInfo;

  @override
  State<FollowersScreen> createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        const SizedBox(
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.current.followers,
                style: LibraryStyles.poppins34Bold,
                maxLines: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              SearchTextfield(controller: controller),
            ],
          ),
        ),
        BlocProvider(
          create: (_) => FollowersBloc(),
          child: FollowersList(user: widget.userInfo),
        )
      ],
    );
  }
}
