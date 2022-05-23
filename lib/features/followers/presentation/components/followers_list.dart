import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sputnik_test/components/error_text.dart';
import 'package:sputnik_test/components/library_loader.dart';
import 'package:sputnik_test/core/entities/user_info.dart';
import 'package:sputnik_test/features/followers/presentation/bloc/bloc/followers_bloc.dart';
import 'package:sputnik_test/features/followers/presentation/components/follower_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sputnik_test/generated/l10n.dart';

class FollowersList extends StatefulWidget {
  const FollowersList({required this.user, Key? key}) : super(key: key);
  final UserInfo user;

  @override
  State<FollowersList> createState() => _FollowersListState();
}

class _FollowersListState extends State<FollowersList> {
  late RefreshController _refreshController;
  @override
  void initState() {
    BlocProvider.of<FollowersBloc>(context)
        .add(OnGetFollowers(widget.user.login));
    _refreshController = RefreshController();
    super.initState();
  }

  void _onRefresh() {
    BlocProvider.of<FollowersBloc>(context)
        .add(OnGetFollowers(widget.user.login));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FollowersBloc, FollowersState>(
      listener: (_, state) {
        if (state is FollowersLoadedState) {
          _refreshController.loadComplete();
        }
      },
      builder: (_, state) {
        if (state is FollowersLoadingState) {
          return const Padding(
            padding: EdgeInsets.only(top: 150),
            child: LibraryLoader(),
          );
        }
        if (state is SomethingWentWrongState) {
          return ErrorText(text: S.current.wrong);
        }
        if (state is TooManyAttemptsState) {
          return ErrorText(text: S.current.tooManyAttempts);
        }
        if (state is FollowersEmptyState) {
          return ErrorText(text: S.current.noFollowers);
        }
        if (state is FollowersLoadedState) {
          return Expanded(
            child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: false,
              onRefresh: _onRefresh,
              controller: _refreshController,
              header: const WaterDropHeader(),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Followercard(
                  oneFollowerInfo: state.followersList[index],
                  index: index,
                  listLenght: state.followersList.length,
                ),
                itemCount: state.followersList.length,
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
