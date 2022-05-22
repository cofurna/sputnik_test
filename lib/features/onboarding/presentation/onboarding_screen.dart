import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sputnik_test/components/buttons/gradient_text_button.dart';
import 'package:sputnik_test/core/services/hive_service.dart';
import 'package:sputnik_test/features/onboarding/presentation/components/slider_dots.dart';
import 'package:sputnik_test/features/onboarding/presentation/components/slider_element.dart';
import 'package:sputnik_test/generated/l10n.dart';
import 'package:sputnik_test/statics/assets.dart';
import 'package:sputnik_test/utils/navigation/routes.dart';
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

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(top: 24 * Scaler.getMainScaleHeight(context)),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CarouselSlider(
                    items: sliderList,
                    options: CarouselOptions(
                      autoPlay: true,
                      height: Scaler.getEmptySizeHeight(context) *
                          Scaler.carouselScale,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 22),
                  SliderDots(
                    count: sliderList.length,
                    currentIndex: _currentIndex,
                  ),
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21),
                    child: GradientTextButton(
                      text: S.current.next,
                      onTap: () {
                        HiveService.setFirstLaunch();
                        Navigator.of(context).pushNamed(
                          LibraryRoutes.searchUser,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 43),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 39 * Scaler.getMainScaleWidth(context)),
                child: Image.asset(
                  LibraryAssets.logo,
                  height: 85 * Scaler.getMainScaleHeight(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
