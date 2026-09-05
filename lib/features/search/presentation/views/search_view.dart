import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/git_it_service.dart';
import 'package:movie_app/core/widgets/custom_nav_bar.dart';
import 'package:movie_app/features/home/presentation/views/home_view.dart';
import 'package:movie_app/features/profile/presentation/views/profile_view.dart';
import 'package:movie_app/features/search/data/serch_repo.dart';
import 'package:movie_app/features/search/presentation/cubits/search_cubit/search_cubit_cubit.dart';
import 'package:movie_app/features/search/presentation/widgets/search_view_body.dart';
import 'package:movie_app/features/wishlist/presentation/views/whishlist_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  static const String routeName = 'search';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchCubit(getIt<SearchRepo>())..fetchSearchGenres(),
      child: Scaffold(
        body: const SafeArea(child: SearchViewBody()),
        bottomNavigationBar: CustomNavBar(
          selectedIndex: 1,
          onTap: (index) {
            if (index == 0) {
              Navigator.pushNamed(context, HomeView.routeName);
            } else if (index == 2) {
              Navigator.pushNamed(context, WhishlistView.routeName);
            } else if (index == 3) {
              Navigator.pushNamed(context, ProfileView.routeName);
            }
          },
        ),
      ),
    );
  }
}
