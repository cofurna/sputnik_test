import 'package:flutter/material.dart';
import 'package:sputnik_test/features/followers/presentation/followers_screen.dart';
import 'package:sputnik_test/features/home/presentation/home_screen.dart';
import 'package:sputnik_test/features/profile/presentation/profile_screen.dart';
import 'package:sputnik_test/features/root_tab/components/library_bottom_navigation_bar.dart';
import 'package:sputnik_test/core/entities/user_info.dart';
import 'package:sputnik_test/utils/navigation/screens.dart';

class RootTab extends StatefulWidget {
  const RootTab({
    required this.userInfo,
    Key? key,
  }) : super(key: key);

  final UserInfo userInfo;

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: LibraryBottomNavigationBar(
        currentIndex: _tabController.index,
        onTabChanged: (int index) {
          setState(() {
            _tabController.animateTo(index);
          });
        },
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(userInfo: widget.userInfo),
          FollowersScreen(
            userInfo: widget.userInfo,
          ),
          Container(),
          ProfileScreen(userInfo: widget.userInfo),
        ],
      ),
    );
  }
}
