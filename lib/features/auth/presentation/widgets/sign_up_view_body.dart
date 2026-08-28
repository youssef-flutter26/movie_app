import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/core/widgets/custom_text_field.dart';
import 'package:movie_app/core/widgets/password_field.dart';
import 'package:movie_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:movie_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:movie_app/features/auth/presentation/widgets/terms_conditions.dart';

class SignUpViewBody extends StatefulWidget {
  const new({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
late String email, password, userName;
late bool isTermsAccepted = false;

class _SignUpViewBodyState extends State<SignUpViewBody> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Center(child: Text('Lets get started', style: TextStyles.bold23)),
            SizedBox(height: 8),
            Text(
              'The latest movies and series are here',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),

            CustomTextField(
              onSaved: (value) {
                userName = value!;
              },
              labelText: 'Full Name ',
            ),
            SizedBox(height: 32),

            CustomTextField(
              onSaved: (value) {
                email = value!;
              },
              labelText: 'Email Address',
            ),
            SizedBox(height: 32),
            PasswordField(
              onSaved: (value) {
                password = value!;
              },
            ),
            SizedBox(height: 32),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: TermsAndConditionsWidget(
                onChanged: (value) {
                  isTermsAccepted = value;
                },
              ),
            ),
            SizedBox(height: 36),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAccepted) {
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            email,
                            password,
                            userName,
                          );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          duration: const Duration(seconds: 1),
                          content: Text('Please accept terms and conditions'),
                        ),
                      );
                      ;
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                child: CustomButton(text: 'Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
