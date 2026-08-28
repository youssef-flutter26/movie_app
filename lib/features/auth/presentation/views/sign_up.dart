import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/git_it_service.dart';
import 'package:movie_app/core/widgets/build_appbar.dart';
import 'package:movie_app/features/auth/domain/repos/auth_repo.dart';
import 'package:movie_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:movie_app/features/auth/presentation/widgets/sign_up_view_body.dart';
import 'package:movie_app/features/auth/presentation/widgets/signup_view_body_bloc_consumer.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  static const String routeName = 'signUp';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, tittle: 'Sign Up'),
        body: SignupViewBodyBlocConsumer(),
      ),
    );
  }
}
