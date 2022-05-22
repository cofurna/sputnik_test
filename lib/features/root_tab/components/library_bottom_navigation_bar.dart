import 'package:flutter/material.dart';
import 'package:sputnik_test/components/buttons/nav_bar_button.dart';
import 'package:sputnik_test/statics/icons.dart';

class LibraryBottomNavigationBar extends StatelessWidget {
  const LibraryBottomNavigationBar({
    required this.currentIndex,
    required this.onTabChanged,
    Key? key,
  }) : super(key: key);

  final int currentIndex;
  final Function(int index) onTabChanged;

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    return SizedBox(
      height: 86 + bottomPadding,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavBarButton(
              isActive: currentIndex == 0,
              onTap: () => onTabChanged(0),
              title: 'Home',
              icon: LibraryIcons.home,
              hasNotification: false,
            ),
            NavBarButton(
              isActive: currentIndex == 1,
              onTap: () => onTabChanged(1),
              title: 'Home',
              icon: LibraryIcons.home,
              hasNotification: false,
            ),
            NavBarButton(
              isActive: currentIndex == 2,
              onTap: () => onTabChanged(2),
              title: 'Home',
              icon: LibraryIcons.home,
              hasNotification: false,
            ),
            NavBarButton(
              isActive: currentIndex == 3,
              onTap: () => onTabChanged(3),
              title: 'Home',
              icon: LibraryIcons.home,
              hasNotification: false,
            ),
          ],
        ),
      ),
    );
  }
}
