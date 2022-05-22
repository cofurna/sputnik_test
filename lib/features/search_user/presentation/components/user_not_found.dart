import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sputnik_test/features/search_user/presentation/bloc/bloc/search_user_bloc.dart';
import 'package:sputnik_test/statics/assets.dart';
import 'package:sputnik_test/generated/l10n.dart';
import 'package:sputnik_test/statics/colors.dart';
import 'package:sputnik_test/statics/styles.dart';

class UserNotFound extends StatelessWidget {
  const UserNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchUserBloc, SearchUserState>(
      builder: (_, state) {
        if (state is! UserNotFoundState && state is! SomethingWentWrongState) {
          return const SizedBox.shrink();
        }
        return Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Image.asset(
              LibraryAssets.userNotFound,
              height: 100,
              filterQuality: FilterQuality.high,
            ),
            const SizedBox(
              height: 17,
            ),
            Text(
              state is UserNotFoundState
                  ? S.current.userNotFound
                  : "agnjangjksjkgnh sjgjkinsg",
              textAlign: TextAlign.center,
              style: LibraryStyles.poppins24Medium
                  .copyWith(color: LibraryColors.red),
            ),
          ],
        );
      },
    );
  }
}
