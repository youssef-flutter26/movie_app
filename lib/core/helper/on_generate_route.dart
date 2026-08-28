import 'package:flutter/material.dart';
import 'package:movie_app/features/auth/presentation/views/create_new_password_view.dart';
import 'package:movie_app/features/auth/presentation/views/login_view.dart';
import 'package:movie_app/features/auth/presentation/views/reset_password_view.dart';
import 'package:movie_app/features/auth/presentation/views/sign_up.dart';
import 'package:movie_app/features/auth/presentation/views/start_login.dart';
import 'package:movie_app/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:movie_app/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case CreateNewPasswordView.routeName:
      return MaterialPageRoute(
        builder: (context) => const CreateNewPasswordView(),
      );
    case ResetPasswordView.routeName:
      return MaterialPageRoute(builder: (context) => const ResetPasswordView());
    case SignUp.routeName:
      return MaterialPageRoute(builder: (context) => const SignUp());
    case StartLogin.routeName:
      return MaterialPageRoute(builder: (context) => const StartLogin());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    default:
      return MaterialPageRoute(
        builder: (context) =>
            const Scaffold(body: Center(child: Text('No Route Defined'))),
      );
  }
}
