import 'package:flutter/material.dart';
import 'package:sputnik_test/statics/colors.dart';

class LibraryLoader extends StatelessWidget {
  const LibraryLoader({this.size = 80, Key? key}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: const CircularProgressIndicator(
          color: LibraryColors.darkOrange,
        ),
      ),
    );
  }
}
