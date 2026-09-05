import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/custom_nav_bar.dart';
import 'package:movie_app/features/home/presentation/views/home_view.dart';
import 'package:movie_app/features/search/presentation/views/search_view.dart';
import 'package:movie_app/features/wishlist/presentation/views/whishlist_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName = 'main';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;

  final List<Widget> views = const [HomeView(), SearchView(), WhishlistView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: currentIndex, children: views),
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
