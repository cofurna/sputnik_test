import 'package:flutter/material.dart';
import 'package:sputnik_test/core/entities/follower_info.dart';
import 'package:sputnik_test/features/followers/presentation/components/divider.dart';
import 'package:sputnik_test/statics/styles.dart';

class Followercard extends StatelessWidget {
  const Followercard({
    required this.oneFollowerInfo,
    required this.index,
    required this.listLenght,
  });
  final FollowerInfo oneFollowerInfo;
  final int index;
  final int listLenght;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (index == 0)
          const SizedBox(
            height: 28,
          ),
        if (index == 0) const FollowerDividerLine(),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(oneFollowerInfo.avatarUrl),
                radius: 29,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    oneFollowerInfo.login,
                    style: LibraryStyles.poppins20Bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    oneFollowerInfo.id.toString(),
                    style: LibraryStyles.poppins17Medium.copyWith(
                      height: 22 / 17,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        if (index != listLenght - 1) const FollowerDividerLine(),
      ],
    );
  }
}
