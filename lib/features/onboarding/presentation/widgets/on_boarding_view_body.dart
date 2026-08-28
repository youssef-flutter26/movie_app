import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/features/auth/presentation/views/login_view.dart';
import 'package:movie_app/features/onboarding/presentation/widgets/custom_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1D2B),
      body: Column(
        children: [
          Expanded(child: CustomPageView(pageController: pageController)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Indicators
                SvgPicture.asset(
                  currentPage == 0
                      ? Assets.imagesSlider1
                      : currentPage == 1
                      ? Assets.imagesSlider2
                      : Assets.imagesSlider3,
                ),
                // Next Button
                GestureDetector(
                  onTap: () {
                    if (currentPage < 2) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.pushReplacementNamed(
                        context,
                        LoginView.routeName,
                      );
                    }
                  },
                  child: SvgPicture.asset(
                    currentPage == 0
                        ? Assets.imagesNext1
                        : currentPage == 1
                        ? Assets.imagesNext2
                        : Assets.imagesNext3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
