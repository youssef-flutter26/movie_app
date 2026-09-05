import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/models/genre_model.dart';

class CategoriesListView extends StatefulWidget {
  final List<GenreModel> genres;
  final ValueChanged<GenreModel>? onGenreSelected;

  const CategoriesListView({
    super.key,
    required this.genres,
    this.onGenreSelected,
  });

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 31.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.genres.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          final genre = widget.genres[index];

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              if (widget.onGenreSelected != null) {
                widget.onGenreSelected!(genre);
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: EdgeInsets.only(right: 12.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF252836)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Text(
                  genre.name ?? '',
                  style: TextStyle(
                    color: isSelected ? const Color(0xFF12CDD9) : Colors.white,
                    fontSize: 14.sp,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
