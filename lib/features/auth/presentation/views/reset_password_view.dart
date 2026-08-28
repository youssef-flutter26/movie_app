import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/build_appbar.dart';
import 'package:movie_app/features/auth/presentation/widgets/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});
  static const routeName = 'resetPassword';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, tittle: ''),

      body: ResetPasswordViewBody(),
    );
  }
}
