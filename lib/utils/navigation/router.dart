import 'package:flutter/material.dart';
import 'package:sputnik_test/features/search_user/presentation/bloc/bloc/search_user_bloc.dart';
import 'package:sputnik_test/core/entities/user_info.dart';
import 'package:sputnik_test/utils/navigation/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class LibraryRouter {
  static Route buildRoute(Widget widget, {RouteSettings? settings}) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Route route(Widget widget) => buildRoute(widget, settings: settings);

    switch (settings.name) {
      case LibraryRoutes.app:
        return route(const App());
      case LibraryRoutes.searchUser:
        return route(BlocProvider(
          create: (context) => SearchUserBloc(),
          child: const SearchUserScreen(isFirstLaunch: true),
        ));
      case LibraryRoutes.rootTabs:
        return route(
          RootTab(
            userInfo: settings.arguments as UserInfo,
          ),
        );
      default:
        return route(const App());
    }
  }
}
