import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:sputnik_test/generated/l10n.dart';
import 'package:sputnik_test/statics/colors.dart';
import 'package:sputnik_test/utils/navigation/router.dart';
import 'package:sputnik_test/utils/navigation/routes.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode f = FocusScope.of(context);
        if (!f.hasPrimaryFocus && f.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: LibraryColors.backGround,
        ),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        initialRoute: LibraryRoutes.app,
        onGenerateRoute: LibraryRouter.generateRoute,
        navigatorKey: navigatorKey,
      ),
    );
  }
}
