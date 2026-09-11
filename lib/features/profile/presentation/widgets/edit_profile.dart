import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/constant.dart';
import 'package:movie_app/core/widgets/build_appbar.dart';
import 'package:movie_app/core/widgets/custom_nav_bar.dart';
import 'package:movie_app/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:movie_app/features/profile/presentation/widgets/edit_profile_body.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  static const String routeName = 'editProfile';

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // استدعاء جلب البيانات وتمرير التوكن الثابت المعرف في ملف constant.dart
      context.read<ProfileCubit>().getUserProfile(token: tmdbToken);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, tittle: 'Edit Profile'),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileFailure) {
            return Center(
              child: Text(
                state.errMessage,
                style: const TextStyle(color: Colors.white),
              ),
            );
          } else if (state is ProfileSuccess) {
            return EditProfileBody(userModel: state.userModel);
          }

          return const Center(
            child: Text(
              'No Profile Data Available',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomNavBar(selectedIndex: 3),
    );
  }
}
