import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/constant.dart';
import 'package:movie_app/core/services/firebase_auth_service.dart';
import 'package:movie_app/core/services/shared_pref.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/features/auth/presentation/views/login_view.dart';
import 'package:movie_app/features/home/presentation/views/home_view.dart';
import 'package:movie_app/features/onboarding/presentation/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNavigation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.imagesCinemax, height: 138.h, width: 138.w),
          ],
        ),
      ],
    );
  }

  void excuteNavigation() {
    bool isOnBoardingViewSeen = SharedPref.getBool(KiOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 3), () {
      // Navigator.pushReplacementNamed(context, Routes.home);
      if (mounted) {
        if (isOnBoardingViewSeen) {
          var isLoggedIn = FirebaseAuthService().isUserLoggedIn();
          if (isLoggedIn) {
            Navigator.pushReplacementNamed(context, HomeView.routeName);
          } else {
            Navigator.pushReplacementNamed(context, LoginView.routeName);
          }
        } else {
          Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
        }
      }
    });
  }
}
