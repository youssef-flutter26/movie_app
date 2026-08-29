import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';

class SignWithSocialMedia extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 69.w,
          height: 69.h,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: GestureDetector(
              onTap: () {
                context.read<LoginCubit>().signInWithGoogle();
              },
              child: FaIcon(
                FontAwesomeIcons.google,
                color: Colors.black,
                size: 32.r,
              ),
            ),
          ),
        ),
        SizedBox(width: 50.w),
        Container(
          width: 69.w,
          height: 69.h,
          decoration: BoxDecoration(
            color: Color(0xff4267B2),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: GestureDetector(
              onTap: () {
                context.read<LoginCubit>().signInWithFacebook();
              },
              child: FaIcon(
                FontAwesomeIcons.facebook,
                color: Colors.white,
                size: 32.r,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
