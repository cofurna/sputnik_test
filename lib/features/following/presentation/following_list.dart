import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sputnik_test/components/buttons/text_button_custom.dart';
import 'package:sputnik_test/components/error_text.dart';
import 'package:sputnik_test/components/library_loader.dart';

import 'package:sputnik_test/core/entities/user_info.dart';
import 'package:sputnik_test/core/services/github_link_generator.dart';
import 'package:sputnik_test/features/following/presentation/bloc/following_bloc.dart';

import 'package:sputnik_test/features/following/presentation/following_card.dart';
import 'package:sputnik_test/features/home/presentation/components/divider.dart';

import 'package:sputnik_test/statics/styles.dart';

import 'package:sputnik_test/generated/l10n.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FollowingList extends StatefulWidget {
  const FollowingList({
    required this.user,
    Key? key,
  }) : super(key: key);

  final UserInfo user;

  @override
  State<FollowingList> createState() => _FollowingListState();
}

class _FollowingListState extends State<FollowingList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FollowingBloc>(context)
        .add(OnGetFollowing(widget.user.login));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.current.followingYou,
                style: LibraryStyles.poppins34Bold,
                maxLines: 1,
              ),
              TextButtonCustom(
                onTap: () async {
                  await launchUrlString(
                    GithubLinkGenerator.gitHubUserFollowingUrl(
                        widget.user.login),
                  );
                },
                text: S.current.viewAll,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 19,
        ),
        Container(
          height: 180,
          child: BlocBuilder<FollowingBloc, FollowingState>(
            builder: (_, state) {
              if (state is FollowingLoadingState) {
                return const LibraryLoader();
              }
              if (state is SomethingWentWrongState) {
                return ErrorText(text: S.current.wrong);
              }
              if (state is TooManyAttemptsState) {
                return ErrorText(text: S.current.tooManyAttempts);
              }
              if (state is FollowingEmptyState) {
                return ErrorText(text: S.current.noFollowing);
              }
              if (state is FollowingLoadedState) {
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => FollowingCard(
                    oneFollowingInfo: state.followingList[index],
                    index: index,
                    listLenght: state.followingList.length,
                  ),
                  separatorBuilder: (context, _) => const SizedBox(
                    width: 2,
                  ),
                  itemCount: state.followingList.length,
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
        const SizedBox(
          height: 19,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: DividerLine(),
        ),
      ],
    );
  }
}
