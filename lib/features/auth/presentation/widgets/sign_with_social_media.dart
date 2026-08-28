import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          width: 69,
          height: 69,
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
                size: 32,
              ),
            ),
          ),
        ),
        SizedBox(width: 50),
        Container(
          width: 69,
          height: 69,
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
                size: 32,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
