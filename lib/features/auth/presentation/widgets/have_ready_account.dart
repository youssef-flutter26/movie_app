import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/features/auth/presentation/views/start_login.dart';

class HaveReadyAccount extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'I already have an account?',
          style: TextStyles.medium15.copyWith(color: Color(0xFF92929D)),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, StartLogin.routeName);
          },
          child: Text(
            'Login',
            style: TextStyles.bold19.copyWith(color: AppColors.ksecondaryColor),
          ),
        ),
      ],
    );
  }
}
