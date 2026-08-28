import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/core/widgets/custom_text_field.dart';
import 'package:movie_app/features/auth/presentation/views/create_new_password_view.dart';
import 'package:movie_app/features/auth/presentation/widgets/custom_button.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text('Reset Password', style: TextStyles.bold23)),
        SizedBox(height: 8),
        Text('Recover your account password', textAlign: TextAlign.center),
        CustomTextField(labelText: 'Email Address'),
        SizedBox(height: 32),
        SizedBox(height: 10),
        SizedBox(height: 32),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, CreateNewPasswordView.routeName);
            },
            child: CustomButton(text: 'Next'),
          ),
        ),
      ],
    );
  }
}
