import 'package:flutter/material.dart';

import 'package:sputnik_test/statics/colors.dart';
import 'package:sputnik_test/statics/styles.dart';
import 'package:sputnik_test/core/entities/following_info.dart';

class FollowingCard extends StatelessWidget {
  const FollowingCard({
    required this.oneFollowingInfo,
    required this.index,
    required this.listLenght,
  });
  final FollowingInfo oneFollowingInfo;
  final int index;
  final int listLenght;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: index == 0 ? 16 : 20, right: index == listLenght - 1 ? 16 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(oneFollowingInfo.avatarUrl),
            radius: 60,
          ),
          const SizedBox(
            height: 6,
          ),
          Container(
            width: 120,
            child: Text(
              oneFollowingInfo.login,
              style: LibraryStyles.poppins17Medium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            oneFollowingInfo.id.toString(),
            style: LibraryStyles.poppins10Medium
                .copyWith(color: LibraryColors.secondaryLightGrey),
          ),
        ],
      ),
    );
  }
}
