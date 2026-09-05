import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/features/details/presentation/views/movie_details.dart';
import 'package:movie_app/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:movie_app/features/home/presentation/cubits/home_cubit/home_state.dart';
import 'package:movie_app/features/home/presentation/widgets/categories_list_view.dart';
import 'package:movie_app/features/home/presentation/widgets/custom_most_popular_movie.dart';
import 'package:movie_app/features/home/presentation/widgets/featured_most_popular_list_view.dart';
import 'package:movie_app/features/home/presentation/widgets/featured_movie_card.dart';
import 'package:movie_app/features/home/presentation/widgets/hello_user.dart';
import 'package:movie_app/features/home/presentation/widgets/search_text_field.dart';
import 'package:movie_app/features/search/presentation/views/search_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HelloUser(),
            SizedBox(height: 24.h),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, SearchView.routeName);
              },
              child: const AbsorbPointer(child: SearchTextField()),
            ),
            SizedBox(height: 24.h),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 100),
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is HomeFailure) {
                  return Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                } else if (state is HomeSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (state.nowPlayingMovies.isNotEmpty) ...[
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              MovieDetails.routeName,
                              arguments: state.nowPlayingMovies.first,
                            );
                          },
                          child: FeaturedMovieListview(
                            movies: state.nowPlayingMovies,
                          ),
                        ),
                        SizedBox(height: 24.h),
                      ],
                      Text('Categories', style: TextStyles.bold23),
                      SizedBox(height: 16.h),
                      CategoriesListView(
                        genres: state.genres,
                        onGenreSelected: (selectedGenre) {
                          if (selectedGenre.id != null) {
                            context.read<HomeCubit>().fetchMoviesByGenre(
                              genreId: selectedGenre.id!,
                            );
                          }
                        },
                      ),
                      SizedBox(height: 24.h),
                      CustomMostPopularMovies(
                        title: 'Most Popular',
                        style: TextStyles.bold23,
                      ),
                      SizedBox(height: 16.h),
                      FeaturedMostPopularListView(movies: state.popularMovies),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
