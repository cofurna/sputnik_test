import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sputnik_test/features/onboarding/presentation/components/slider_element.dart';
import 'package:sputnik_test/generated/l10n.dart';
import 'package:sputnik_test/statics/assets.dart';
import 'package:sputnik_test/utils/scaler.dart';

List<SliderElement> sliderList = [
  SliderElement(
    sliderImage: LibraryAssets.onboardingImage1,
    sliderText: S.current.onboardingSlide1,
    imageScale: 0.8,
  ),
  SliderElement(
    sliderImage: LibraryAssets.onboardingImage2,
    verticalSpace: 22,
    sliderText: S.current.onboardingSlide2,
    imageScale: 0.57,
  ),
  SliderElement(
    sliderImage: LibraryAssets.onboardingImage3,
    verticalSpace: 103,
    sliderText: S.current.onboardingSlide3,
    imageScale: 0.52,
  ),
];

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 24 * Scaler.getMainScale(context)),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CarouselSlider(
                    items: sliderList,
                    options: CarouselOptions(
                      height:
                          Scaler.getEmptySize(context) * Scaler.carouselScale,
                      viewportFraction: 1,
                    ),
                  ),
                  const SizedBox(height: 22),
                  Container(
                    height: 30,
                    color: Colors.blue,
                    width: 100,
                  ),
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: SizedBox(
                          width: double.infinity,
                          height: 58,
                          child: Text('jhhjdbdhjsd')),
                    ),
                  ),
                  const SizedBox(height: 43),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 39 * Scaler.getMainScale(context)),
                child: Image.asset(
                  LibraryAssets.logo,
                  height: 85 * Scaler.getMainScale(context),
                ),
              ),
            ],
          ),
        ),
      ),

      //button
    );
  }
}
