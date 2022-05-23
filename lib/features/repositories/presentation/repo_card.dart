import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sputnik_test/core/entities/repo_info.dart';

import 'package:sputnik_test/statics/colors.dart';
import 'package:sputnik_test/statics/icons.dart';
import 'package:sputnik_test/statics/styles.dart';
import 'package:sputnik_test/utils/extensions/string_ext.dart';

class RepoCard extends StatelessWidget {
  const RepoCard({
    required this.oneRepoInfo,
    required this.index,
    required this.listLenght,
  });
  final RepoInfo oneRepoInfo;
  final int index;
  final int listLenght;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: index == 0 ? 27 : 24, right: index == listLenght - 1 ? 27 : 0),
      child: Container(
        width: 165,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, right: 8),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: LibraryColors.yellow,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 8,
                          left: 15,
                          bottom: 10,
                        ),
                        child: AutoSizeText(
                          oneRepoInfo.language?.abbreviation ?? 'UNK',
                          style: LibraryStyles.poppins50Bold,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 49,
                  height: 25,
                  decoration: BoxDecoration(
                    color: LibraryColors.greyOpacity20,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        LibraryIcons.star,
                        color: LibraryColors.yellow,
                        size: 8,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        oneRepoInfo.stargazersCount.toString(),
                        style: LibraryStyles.poppins10SemiBold
                            .copyWith(color: LibraryColors.yellow),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        oneRepoInfo.name,
                        style: LibraryStyles.poppins17Medium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      oneRepoInfo.id.toString(),
                      style: LibraryStyles.poppins10Medium
                          .copyWith(color: LibraryColors.secondaryLightGrey),
                    ),
                  ],
                ),
                Container(
                  width: 54,
                  height: 25,
                  decoration: BoxDecoration(
                    color: LibraryColors.mainGreyColor,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        LibraryIcons.gitfork,
                        color: LibraryColors.white,
                        size: 13,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        oneRepoInfo.stargazersCount.toString(),
                        style: LibraryStyles.poppins10Medium.copyWith(
                            color: LibraryColors.white, height: 15 / 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
