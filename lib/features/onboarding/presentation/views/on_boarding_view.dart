import 'package:flutter/material.dart';
import 'package:movie_app/features/onboarding/presentation/widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const new({super.key});
  static const String routeName = 'onBoarding';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(extendBodyBehindAppBar: true, body: OnBoardingViewBody()),
    );
  }
}
