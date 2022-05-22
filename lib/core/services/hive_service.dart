import 'package:hive_flutter/hive_flutter.dart';

class HiveKeys {
  static const String isFirstLaunch = 'isFirstLaunch';
}

class HiveService {
  static Future<bool> isFirstLaunch() async {
    final isFirstLaunchBox = await Hive.openBox(HiveKeys.isFirstLaunch);
    final isFirstLaunch = isFirstLaunchBox.get(
      HiveKeys.isFirstLaunch,
      defaultValue: true,
    );

    return isFirstLaunch;
  }

  static Future<void> setFirstLaunch() async {
    final isFirstLaunchBox = await Hive.openBox(HiveKeys.isFirstLaunch);

    await isFirstLaunchBox.put(HiveKeys.isFirstLaunch, false);
  }
}
