import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sputnik_test/components/buttons/gradient_text_button.dart';
import 'package:sputnik_test/features/search_user/presentation/bloc/bloc/search_user_bloc.dart';
import 'package:sputnik_test/features/search_user/presentation/components/agreement.dart';
import 'package:sputnik_test/generated/l10n.dart';
import 'package:sputnik_test/utils/extensions/context_ext.dart';

class SearchUserFAB extends StatelessWidget {
  const SearchUserFAB({required this.controller, Key? key}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    if (context.isKeyboardOpen) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GradientTextButton(
            onTap: controller.text.isEmpty
                ? null
                : () {
                    BlocProvider.of<SearchUserBloc>(context).add(
                      OnSearchUser(
                        controller.text.trim(),
                      ),
                    );
                  },
            text: S.current.search,
          ),
          const SizedBox(height: 25),
          const Agreement(),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
