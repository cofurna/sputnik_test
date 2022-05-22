import 'package:flutter/material.dart';
import 'package:sputnik_test/statics/colors.dart';
import 'package:sputnik_test/statics/styles.dart';

class SliderDots extends StatelessWidget {
  const SliderDots({required this.count, required this.currentIndex, Key? key})
      : super(key: key);

  final int count;
  final int currentIndex;

  List<Widget> getDots(int dotsCount, int dotActiveIndex) {
    final List<Widget> dots = [];
    for (int index = 0; index < dotsCount; index++) {
      dots.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: _SliderDot(
            index: index,
            isActive: index == dotActiveIndex,
          ),
        ),
      );
    }

    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: getDots(count, currentIndex),
    );
  }
}

const Duration _animationDuration = Duration(milliseconds: 300);

class _SliderDot extends StatelessWidget {
  const _SliderDot({
    required this.isActive,
    required this.index,
    Key? key,
  }) : super(key: key);

  final bool isActive;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _animationDuration,
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: isActive ? LibraryColors.white : LibraryColors.dotsDisabled,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          index.toString(),
          style: LibraryStyles.poppins13Medium.copyWith(
            color: isActive ? LibraryColors.dotsDisabled : LibraryColors.white,
          ),
        ),
      ),
    );
  }
}
