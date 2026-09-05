import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/git_it_service.dart';
import 'package:movie_app/core/widgets/custom_nav_bar.dart';
import 'package:movie_app/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:movie_app/features/home/presentation/widgets/home_view_body.dart';
import 'package:movie_app/features/search/presentation/views/search_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const routeName = 'home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  final List<Widget> screens = const [
    SingleChildScrollView(child: HomeViewBody()), // Index 0: Home
    SearchView(), // Index 1: Search
    Center(
      child: Text('Wishlist Screen', style: TextStyle(color: Colors.white)),
    ), // Index 2: Wishlist
    Center(
      child: Text('Profile Screen', style: TextStyle(color: Colors.white)),
    ), // Index 3: Profile
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..fetchHomeData(),
      child: SafeArea(
        child: Scaffold(
          body: IndexedStack(index: selectedIndex, children: screens),
          bottomNavigationBar: CustomNavBar(
            selectedIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
