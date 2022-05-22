import 'package:flutter/material.dart';
import 'package:sputnik_test/features/home/presentation/components/home_one_repository.dart';

import 'package:sputnik_test/statics/styles.dart';
import 'package:sputnik_test/utils/navigation/screens.dart';
import 'package:sputnik_test/generated/l10n.dart';

class HomeRepositories extends StatelessWidget {
  const HomeRepositories({required this.repoList});
  final List<RepoInfo> repoList;

  @override
  Widget build(BuildContext context) {
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
              Text(
                S.current.viewAll,
                style: LibraryStyles.poppins15Normal.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          height: 180,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => HomeOneRepository(
              oneRepoInfo: repoList[index],
              index: index,
              listLenght: repoList.length,
            ),
            separatorBuilder: (context, _) => const SizedBox(
              width: 2,
            ),
            itemCount: repoList.length,
          ),
        ),
      ],
    );
  }
}
