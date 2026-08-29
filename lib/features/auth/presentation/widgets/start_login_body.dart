import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/core/widgets/custom_text_field.dart';
import 'package:movie_app/core/widgets/password_field.dart';
import 'package:movie_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:movie_app/features/auth/presentation/views/reset_password_view.dart';
import 'package:movie_app/features/auth/presentation/widgets/custom_button.dart';

class StartLoginBody extends StatefulWidget {
  const new({super.key});

  @override
  State<StartLoginBody> createState() => _StartLoginBodyState();
}

class _StartLoginBodyState extends State<StartLoginBody> {
  late String email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0.h),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            Center(child: Text('Hi, Tiffany', style: TextStyles.bold23)),
            SizedBox(height: 8.h),
            Text(
              'Welcome back! Please enter\n your details.',
              textAlign: TextAlign.center,
            ),
            CustomTextField(
              onSaved: (value) {
                email = value!;
              },
              labelText: 'Email Address',
            ),
            SizedBox(height: 32.h),
            PasswordField(
              onSaved: (value) {
                password = value!;
              },
            ),
            SizedBox(height: 10.h),

            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ResetPasswordView.routeName);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyles.semiBold16.copyWith(
                      color: AppColors.ksecondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              child: GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    context.read<LoginCubit>().loginWithEmailAndPassword(
                      email,
                      password,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                child: CustomButton(text: 'Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
