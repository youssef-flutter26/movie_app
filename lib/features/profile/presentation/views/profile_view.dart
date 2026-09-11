import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/git_it_service.dart';
import 'package:movie_app/core/widgets/custom_nav_bar.dart';
import 'package:movie_app/features/home/presentation/views/home_view.dart';
import 'package:movie_app/features/profile/data/repos/profile_repo.dart';
import 'package:movie_app/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:movie_app/features/profile/presentation/widgets/profile_view_body.dart';
import 'package:movie_app/features/search/presentation/views/search_view.dart';
import 'package:movie_app/features/wishlist/presentation/views/whishlist_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const String routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(getIt<ProfileRepo>())
        ..getUserProfile(
          token: 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YTdlYTA5NmUxMjVlMDUxM2JlNGMxYmE5NTFiZDFiZCIsIm5iZiI6MTc4ODEzNDEyOS42NDYwMDAxLCJzdWIiOiI2YTk0YzJmMWVlZDJmM2Y5NThiMTJiOWUiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.4Itzj_x0pI33QtQuXstB2ETrK2RG7UEBiuMZ6PUJIj8',
        ),
      child: Scaffold(
        body: const SafeArea(
          child: SingleChildScrollView(child: ProfileViewBody()),
        ), // SafeArea
        bottomNavigationBar: CustomNavBar(
          selectedIndex: 3,
          onTap: (index) {
            if (index == 0) {
              Navigator.pushNamed(context, HomeView.routeName);
            } else if (index == 1) {
              Navigator.pushNamed(context, SearchView.routeName);
            } else if (index == 2) {
              Navigator.pushNamed(context, WhishlistView.routeName);
            }
          },
        ), // CustomNavBar
      ), // Scaffold
    ); // BlocProvider
  }
}
