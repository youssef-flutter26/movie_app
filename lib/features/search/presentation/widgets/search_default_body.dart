import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/models/genre_model.dart';
import 'package:movie_app/core/models/movie_model.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/features/details/presentation/views/movie_details.dart';
import 'package:movie_app/features/home/presentation/widgets/categories_list_view.dart';
import 'package:movie_app/features/home/presentation/widgets/custom_most_popular_movie.dart';
import 'package:movie_app/features/home/presentation/widgets/featured_most_popular_list_view.dart';
import 'package:movie_app/features/search/presentation/cubits/search_cubit/search_cubit_cubit.dart';
import 'package:movie_app/features/search/presentation/cubits/search_cubit/search_cubit_state.dart';
import 'package:movie_app/features/search/presentation/widgets/todary_card.dart';

class SearchDefaultBody extends StatefulWidget {
  const SearchDefaultBody({super.key});

  @override
  State<SearchDefaultBody> createState() => _SearchDefaultBodyState();
}

class _SearchDefaultBodyState extends State<SearchDefaultBody> {
  List<GenreModel> savedGenres = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          List<MovieModel> movies = [];

          if (state is SearchGenresSuccess) {
            savedGenres = state.genres;
          } else if (state is SearchDiscoverSuccess) {
            movies = state.movies;
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoriesListView(
                genres: savedGenres,
                onGenreSelected: (selectedGenre) {
                  context.read<SearchCubit>().discoverMoviesByGenre(
                    genreId: selectedGenre.id,
                  );
                },
              ),

              SizedBox(height: 24.h),
              Text('Today', style: TextStyles.bold23),
              SizedBox(height: 12.h),
              InkWell(
                onTap: () {
                  if (movies.isNotEmpty) {
                    final movieId = movies.first.id;
                    Navigator.pushNamed(
                      context,
                      MovieDetails.routeName,
                      arguments: movieId,
                    );
                  }
                },

                child: TodayCard(
                  movie: movies.isNotEmpty ? movies.first : null,
                ),
              ),
              SizedBox(height: 36.h),
              CustomMostPopularMovies(
                title: 'Recommend for you',
                style: TextStyles.bold23,
              ),

              SizedBox(height: 16.h),

              FeaturedMostPopularListView(movies: movies),

              SizedBox(height: 24.h),
            ],
          );
        },
      ),
    );
  }
}
