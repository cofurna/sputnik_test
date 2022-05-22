import 'package:flutter/material.dart';
import 'package:sputnik_test/statics/styles.dart';
import 'package:sputnik_test/utils/scaler.dart';

class SliderElement extends StatelessWidget {
  const SliderElement({
    required this.sliderImage,
    required this.sliderText,
    required this.imageScale,
    this.verticalSpace = 0,
    Key? key,
  }) : super(key: key);

  final String sliderImage;
  final double verticalSpace;
  final String sliderText;
  final double imageScale;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          sliderImage,
          filterQuality: FilterQuality.high,
          height: Scaler.getEmptySizeHeight(context) *
              Scaler.carouselScale *
              imageScale,
        ),
        SizedBox(
          height: verticalSpace * Scaler.getMainScaleHeight(context),
        ),
        Text(
          sliderText,
          textAlign: TextAlign.center,
          style: LibraryStyles.poppins22Bold,
        ),
      ],
    );
  }
}
