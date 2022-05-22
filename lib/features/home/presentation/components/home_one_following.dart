import 'package:flutter/material.dart';
import 'package:sputnik_test/features/home/presentation/home_screen.dart';
import 'package:sputnik_test/statics/colors.dart';
import 'package:sputnik_test/statics/styles.dart';

class HomeOneFollowing extends StatelessWidget {
  const HomeOneFollowing({
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
            backgroundImage: NetworkImage(oneFollowingInfo.urlAvatar),
            radius: 60,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            oneFollowingInfo.login,
            style: LibraryStyles.poppins17Medium,
          ),
          Text(
            oneFollowingInfo.id,
            style: LibraryStyles.poppins10Medium
                .copyWith(color: LibraryColors.secondaryLightGrey),
          ),
        ],
      ),
    );
  }
}
