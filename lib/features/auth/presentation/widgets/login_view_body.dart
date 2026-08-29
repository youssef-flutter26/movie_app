import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/features/auth/presentation/views/sign_up.dart';
import 'package:movie_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:movie_app/features/auth/presentation/widgets/have_ready_account.dart';
import 'package:movie_app/features/auth/presentation/widgets/sign_with_social_media.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.imagesCinemax, height: 88.h),
              SizedBox(height: 8.h),
              Text(
                'Enter your registered\nPhone Number to Sign Up',
                textAlign: TextAlign.center,
                style: TextStyles.semiBold16.copyWith(
                  color: const Color(0xFF92929D),
                  height: 1.4.h,
                ),
              ),
              SizedBox(height: 54.h),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, SignUp.routeName);
                },
                child: CustomButton(text: 'Sign Up'),
              ),
              SizedBox(height: 24.h),

              HaveReadyAccount(),
              SizedBox(height: 32.h),

              Text(
                'Or Sign In with',
                style: TextStyles.medium15.copyWith(
                  color: const Color(0xFF92929D),
                ),
              ),
              SizedBox(height: 32.h),

              SignWithSocialMedia(),
            ],
          ),
        ),
      ),
    );
  }
}
