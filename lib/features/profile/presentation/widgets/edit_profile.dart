import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/build_appbar.dart';
import 'package:movie_app/features/profile/presentation/widgets/edit_profile_body.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});
  static const String routeName = 'editProfile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, tittle: 'Edit Profile'),
      body: EditProfileBody(),
    );
  }
}
