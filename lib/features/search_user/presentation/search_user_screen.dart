import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sputnik_test/components/library_loader.dart';

import 'package:sputnik_test/components/textfields/nickname_textfield.dart';
import 'package:sputnik_test/features/search_user/presentation/bloc/bloc/search_user_bloc.dart';
import 'package:sputnik_test/features/search_user/presentation/components/app_bar.dart';
import 'package:sputnik_test/features/search_user/presentation/components/search_user_fab.dart';
import 'package:sputnik_test/statics/colors.dart';
import 'package:sputnik_test/generated/l10n.dart';
import 'package:sputnik_test/statics/styles.dart';
import 'package:sputnik_test/utils/extensions/context_ext.dart';
import 'package:sputnik_test/utils/navigation/routes.dart';
import 'package:sputnik_test/utils/scaler.dart';
import 'components/user_not_found.dart';

class SearchUserScreen extends StatefulWidget {
  const SearchUserScreen({required this.isFirstLaunch, Key? key})
      : super(key: key);

  final bool isFirstLaunch;

  @override
  State<SearchUserScreen> createState() => _SearchUserScreenState();
}

class _SearchUserScreenState extends State<SearchUserScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SearchUserFAB(controller: controller),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: LibraryColors.backGround,
      appBar: SearchAppBar(
        isFirstLaunch: widget.isFirstLaunch,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocConsumer<SearchUserBloc, SearchUserState>(
          listener: (_, state) {
            if (state is UserFoundedState) {
              Navigator.of(context).pushNamed(
                LibraryRoutes.rootTabs,
                arguments: state.user,
              );
            }
          },
          builder: (_, state) {
            return IgnorePointer(
              ignoring: state is SearchUserLoadingState,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.current.githubSocial,
                          style: LibraryStyles.poppins34Bold,
                        ),
                        Text(
                          S.current.enterNicknameOnGithub,
                          style: LibraryStyles.poppins17Medium.copyWith(
                              color: LibraryColors.secondaryGreyColor),
                        ),
                        const SizedBox(height: 46),
                        NicknameTextfield(controller: controller),
                        const UserNotFound(),
                        SizedBox(height: context.isKeyboardOpen ? 0 : 200),
                      ],
                    ),
                    if (state is SearchUserLoadingState)
                      Positioned.fill(
                        top: (Scaler.getEmptySizeHeight(context) - 45) / 2,
                        child: const LibraryLoader(),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
