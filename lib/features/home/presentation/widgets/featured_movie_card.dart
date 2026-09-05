import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/models/movie_model.dart';
import 'package:movie_app/features/details/presentation/views/movie_details.dart';
import 'package:movie_app/features/home/presentation/widgets/dots_indacator.dart';

class FeaturedMovieListview extends StatefulWidget {
  final List<MovieModel> movies;

  const FeaturedMovieListview({super.key, required this.movies});

  @override
  State<FeaturedMovieListview> createState() => _FeaturedMovieListviewState();
}

class _FeaturedMovieListviewState extends State<FeaturedMovieListview> {
  late PageController pageController;
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      if (pageController.page != null) {
        setState(() {
          currentPageIndex = pageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final displayCount = widget.movies.length > 5 ? 5 : widget.movies.length;

    return Column(
      children: [
        SizedBox(
          height: 170.h,
          child: PageView.builder(
            controller: pageController,
            itemCount: displayCount,
            itemBuilder: (context, index) {
              final movie = widget.movies[index];
              return Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      MovieDetails.routeName,
                      arguments: movie.id,
                    );
                  },
                  child: Container(
                    width: 320.w,
                    height: 154.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500${movie.backdropPath ?? movie.posterPath ?? ''}',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(color: Color(0xFF252836)),
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.8),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 16,
                            bottom: 16,
                            right: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  movie.title ?? '',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    height: 1.25,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  movie.releaseDate ?? '',
                                  style: TextStyle(
                                    color: const Color(0xFFEBEBF5),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 12.h),
        DotsIndicatorRow(activeIndex: currentPageIndex, count: displayCount),
      ],
    );
  }
}
