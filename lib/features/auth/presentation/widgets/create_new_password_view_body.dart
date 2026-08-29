import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/core/widgets/custom_text_field.dart';
import 'package:movie_app/features/auth/presentation/views/create_new_password_view.dart';
import 'package:movie_app/features/auth/presentation/widgets/custom_button.dart';

class CreateNewPasswordViewBody extends StatelessWidget {
  const CreateNewPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text('Create New Password', style: TextStyles.bold23)),
        SizedBox(height: 8.h),
        Text('Enter your new password', textAlign: TextAlign.center),
        CustomTextField(
          labelText: 'New Password',
          suffixIcon: Icon(Icons.visibility_off),
        ),
        SizedBox(height: 32.h),
        CustomTextField(
          labelText: 'Confirm Password',
          suffixIcon: Icon(Icons.visibility_off),
        ),
        SizedBox(height: 10.h),
        SizedBox(height: 32.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, CreateNewPasswordView.routeName);
            },
            child: CustomButton(text: 'Reset'),
          ),
        ),
      ],
    );
  }
}
