import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sputnik_test/features/search_user/presentation/bloc/bloc/search_user_bloc.dart';
import 'package:sputnik_test/statics/assets.dart';
import 'package:sputnik_test/generated/l10n.dart';
import 'package:sputnik_test/statics/colors.dart';
import 'package:sputnik_test/statics/styles.dart';

class SearchUserError extends StatelessWidget {
  const SearchUserError({Key? key}) : super(key: key);

  String getErrorText(SearchUserState state) {
    if (state is UserNotFoundState) {
      return S.current.userNotFound;
    }
    if (state is TooManyAttemptsState) {
      return S.current.tooManyAttempts;
    }

    return S.current.wrong;
  }

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
            Center(
              child: Text(
                getErrorText(state),
                textAlign: TextAlign.center,
                style: LibraryStyles.poppins24Medium
                    .copyWith(color: LibraryColors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
