import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/widgets/custom_nav_bar.dart';
import 'package:movie_app/features/home/presentation/views/home_view.dart';
import 'package:movie_app/features/profile/presentation/views/profile_view.dart';
import 'package:movie_app/features/search/presentation/views/search_view.dart';
import 'package:movie_app/features/wishlist/presentation/cubits/cubit/wishlist_cubit.dart';
import 'package:movie_app/features/wishlist/presentation/widges/whishlist_view_body.dart';

class WhishlistView extends StatefulWidget {
  const WhishlistView({super.key});

  static const String routeName = 'wishlist';

  @override
  State<WhishlistView> createState() => _WhishlistViewState();
}

class _WhishlistViewState extends State<WhishlistView> {
  @override
  void initState() {
    super.initState();
    context.read<WishlistCubit>().fetchWishlist();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const WishlistViewBody(),
        bottomNavigationBar: CustomNavBar(
          selectedIndex: 2,
          onTap: (index) {
            if (index == 2) return;
            if (index == 0) {
              Navigator.pushReplacementNamed(context, HomeView.routeName);
            } else if (index == 1) {
              Navigator.pushReplacementNamed(context, SearchView.routeName);
            } else if (index == 3) {
              Navigator.pushReplacementNamed(context, ProfileView.routeName);
            }
          },
        ),
      ),
    );
  }
}
