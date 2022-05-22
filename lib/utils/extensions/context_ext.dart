import 'package:flutter/cupertino.dart';

extension ContextExt on BuildContext {
  bool get isKeyboardOpen {
    final isKeyboardOpen = MediaQuery.of(this).viewInsets.bottom != 0;

    return isKeyboardOpen;
  }
}
