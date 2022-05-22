import 'package:flutter/material.dart';
import 'package:sputnik_test/statics/colors.dart';

class LibraryLoader extends StatelessWidget {
  const LibraryLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 80,
        width: 80,
        child: CircularProgressIndicator(
          color: LibraryColors.darkOrange,
        ),
      ),
    );
  }
}
