import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/git_it_service.dart';
import 'package:movie_app/core/widgets/build_appbar.dart';
import 'package:movie_app/features/auth/domain/repos/auth_repo.dart';
import 'package:movie_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:movie_app/features/auth/presentation/widgets/start_login_view_body_bloc_consumer.dart';
import 'package:movie_app/features/auth/presentation/widgets/start_login_body.dart';

class StartLogin extends StatelessWidget {
  const StartLogin({super.key});
  static const String routeName = 'stertLogin';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, tittle: 'Login'),
        body: StartLoginViewBodyBlocConsumer(),
      ),
    );
  }
}
