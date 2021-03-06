import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sputnik_test/components/buttons/text_button_custom.dart';
import 'package:sputnik_test/components/error_text.dart';
import 'package:sputnik_test/components/library_loader.dart';
import 'package:sputnik_test/core/entities/user_info.dart';
import 'package:sputnik_test/core/services/github_link_generator.dart';
import 'package:sputnik_test/features/repositories/presentation/bloc/repo_bloc.dart';
import 'package:sputnik_test/features/repositories/presentation/repo_card.dart';
import 'package:sputnik_test/statics/styles.dart';

import 'package:sputnik_test/generated/l10n.dart';
import 'package:url_launcher/url_launcher_string.dart';

class RepoList extends StatefulWidget {
  const RepoList({required this.user});
  final UserInfo user;

  @override
  State<RepoList> createState() => _RepoListState();
}

class _RepoListState extends State<RepoList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<RepoBloc>(context).add(OnGetRepo(widget.user.login));
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
                S.current.repositories,
                style: LibraryStyles.poppins34Bold,
              ),
              TextButtonCustom(
                onTap: () async {
                  await launchUrlString(
                    GithubLinkGenerator.gitHubUserRepoUrl(widget.user.login),
                  );
                },
                text: S.current.viewAll,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          height: 180,
          child: BlocBuilder<RepoBloc, RepoState>(
            builder: (context, state) {
              if (state is RepoLoadingState) {
                return const LibraryLoader();
              }
              if (state is SomethingWentWrongState) {
                return ErrorText(text: S.current.wrong);
              }
              if (state is RepoEmptyState) {
                return ErrorText(text: S.current.noRepositories);
              }
              if (state is TooManyAttemptsState) {
                return ErrorText(text: S.current.tooManyAttempts);
              }
              if (state is RepoLoadedState) {
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => RepoCard(
                    oneRepoInfo: state.repoList[index],
                    index: index,
                    listLenght: state.repoList.length,
                  ),
                  separatorBuilder: (context, _) => const SizedBox(
                    width: 2,
                  ),
                  itemCount: state.repoList.length,
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
