import 'package:flutter/material.dart';
import 'package:sputnik_test/features/home/presentation/components/divider.dart';
import 'package:sputnik_test/features/home/presentation/components/home_one_following.dart';
import 'package:sputnik_test/statics/styles.dart';
import 'package:sputnik_test/utils/navigation/screens.dart';
import 'package:sputnik_test/generated/l10n.dart';

class HomeFollowing extends StatelessWidget {
  const HomeFollowing({required this.followingList});
  final List<FollowingInfo> followingList;

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
                S.current.followingYou,
                style: LibraryStyles.poppins34Bold,
                maxLines: 1,
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
          height: 19,
        ),
        Container(
          height: 180,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => HomeOneFollowing(
              oneFollowingInfo: followingList[index],
              index: index,
              listLenght: followingList.length,
            ),
            separatorBuilder: (context, _) => const SizedBox(
              width: 2,
            ),
            itemCount: followingList.length,
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
