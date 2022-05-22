import 'package:flutter/material.dart';
import 'package:sputnik_test/statics/colors.dart';
import 'package:sputnik_test/statics/icons.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  SearchAppBar({
    required this.isFirstLaunch,
    Key? key,
  })  : preferredSize = const Size.fromHeight(45),
        super(key: key);

  @override
  final Size preferredSize;

  final bool isFirstLaunch;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: LibraryColors.backGround,
      elevation: 0,
      leading: isFirstLaunch
          ? IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                LibraryIcons.arrowBack,
                color: LibraryColors.mainGreyColor,
                size: 22,
              ),
            )
          : null,
    );
  }
}
