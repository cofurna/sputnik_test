import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sputnik_test/components/library_loader.dart';
import 'package:sputnik_test/core/services/hive_service.dart';
import 'package:sputnik_test/features/onboarding/presentation/onboarding_screen.dart';
import 'package:sputnik_test/features/search_user/presentation/bloc/bloc/search_user_bloc.dart';

import 'package:sputnik_test/utils/navigation/screens.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool? isFirstLaunch;

  Future<void> checkIsFirstLaunch() async {
    isFirstLaunch = await HiveService.isFirstLaunch();
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => checkIsFirstLaunch());
  }

  @override
  Widget build(BuildContext context) {
    if (isFirstLaunch == null) {
      return Container(
        color: Colors.white,
        child: const LibraryLoader(),
      );
    }
    if (isFirstLaunch!) {
      return const OnboardingScreen();
    }
    return BlocProvider(
      create: (context) => SearchUserBloc(),
      child: SearchUserScreen(
        isFirstLaunch: isFirstLaunch!,
      ),
    );
  }
}
