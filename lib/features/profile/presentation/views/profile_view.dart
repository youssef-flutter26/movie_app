import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/custom_nav_bar.dart';
import 'package:movie_app/features/home/presentation/views/home_view.dart';
import 'package:movie_app/features/profile/presentation/widgets/profile_view_body.dart';
import 'package:movie_app/features/search/presentation/views/search_view.dart';
import 'package:movie_app/features/wishlist/presentation/views/whishlist_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const String routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: SingleChildScrollView(child: ProfileViewBody()),
      ),
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
      ),
    );
  }
}
