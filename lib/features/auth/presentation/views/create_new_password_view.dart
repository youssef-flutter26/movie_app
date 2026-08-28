import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/build_appbar.dart';
import 'package:movie_app/features/auth/presentation/widgets/create_new_password_view_body.dart';

class CreateNewPasswordView extends StatelessWidget {
  const new({super.key});
  static const routeName = 'createNewPassword';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, tittle: ''),
      body: CreateNewPasswordViewBody(),
    );
  }
}
