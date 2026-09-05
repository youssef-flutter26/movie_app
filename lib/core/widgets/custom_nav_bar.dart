import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/home/presentation/views/home_view.dart';
import 'package:movie_app/features/profile/presentation/views/profile_view.dart';
import 'package:movie_app/features/search/presentation/views/search_view.dart';
import 'package:movie_app/features/wishlist/presentation/views/whishlist_view.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int>? onTap;

  const CustomNavBar({super.key, required this.selectedIndex, this.onTap});

  final List<IconData> icons = const [
    Icons.home_rounded,
    Icons.search_rounded,
    Icons.favorite_border_rounded,
    Icons.person_outline_rounded,
  ];

  final List<String> labels = const ['Home', 'Search', 'Wishlist', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: const BoxDecoration(color: Color(0xFF1F1D2B)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(icons.length, (index) {
          final isSelected = selectedIndex == index;

          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (selectedIndex == index) return;

              switch (index) {
                case 0:
                  Navigator.pushNamed(context, HomeView.routeName);
                  break;
                case 1:
                  Navigator.pushNamed(context, SearchView.routeName);
                  break;
                case 2:
                  Navigator.pushNamed(context, WhishlistView.routeName);
                  break;
                case 3:
                  Navigator.pushReplacementNamed(
                    context,
                    ProfileView.routeName,
                  );
                  break;
              }

              if (onTap != null) {
                onTap!(index);
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: EdgeInsets.symmetric(
                horizontal: isSelected ? 16.w : 12.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF252836)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icons[index],
                    color: isSelected
                        ? const Color(0xFF12CDD9)
                        : const Color(0xFF92929D),
                    size: 24.sp,
                  ),
                  if (isSelected) ...[
                    SizedBox(width: 8.w),
                    Text(
                      labels[index],
                      style: TextStyle(
                        color: const Color(0xFF12CDD9),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
