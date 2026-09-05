import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/models/movie_model.dart';
import 'package:movie_app/core/services/git_it_service.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/core/widgets/custom_nav_bar.dart';
import 'package:movie_app/features/details/data/repos/movie_details_repo.dart';
import 'package:movie_app/features/details/presentation/cubits/cubit/movie_details_cubit.dart';
import 'package:movie_app/features/details/presentation/widgets/movie_details_body.dart';
import 'package:movie_app/features/profile/presentation/views/profile_view.dart';
import 'package:movie_app/features/search/presentation/views/search_view.dart';
import 'package:movie_app/features/wishlist/presentation/cubits/cubit/wishlist_cubit.dart';
import 'package:movie_app/features/wishlist/presentation/cubits/cubit/wishlist_state.dart';
import 'package:movie_app/features/wishlist/presentation/views/whishlist_view.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({required this.movieId, super.key});

  static const routeName = 'movie-details';
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MovieDetailsCubit(getIt<MovieDetailsRepo>())
            ..getMovieDetails(movieId),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            title: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
              builder: (context, state) {
                if (state is MovieDetailsSuccess) {
                  return Text(
                    state.movieDetails.title ?? 'Movie Details',
                    style: TextStyles.bold19,
                  );
                }
                return Text('Movie Details', style: TextStyles.bold19);
              },
            ),
            actions: [
              BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
                builder: (context, detailsState) {
                  if (detailsState is MovieDetailsSuccess) {
                    final details = detailsState.movieDetails;

                    final movie = MovieModel(
                      id: details.id ?? 0,
                      title: details.title ?? '',
                      posterPath: details.posterPath,
                      voteAverage: details.voteAverage ?? 0.0,
                      overview: details.overview,
                      backdropPath: details.backdropPath,
                      releaseDate: details.releaseDate,
                    );

                    return BlocBuilder<WishlistCubit, WishlistState>(
                      builder: (context, wishlistState) {
                        bool isFav = false;
                        if (wishlistState is WishlistLoaded) {
                          isFav = wishlistState.wishlist.any(
                            (element) => element.id == movie.id,
                          );
                        }

                        return IconButton(
                          onPressed: () {
                            context.read<WishlistCubit>().toggleWishlist(movie);
                          },
                          icon: Icon(
                            isFav
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            color: isFav ? Colors.red : Colors.white,
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
              const SizedBox(width: 16),
            ],
          ),
          body: const SingleChildScrollView(child: MovieDetailsBody()),
          bottomNavigationBar: CustomNavBar(
            selectedIndex: 0,
            onTap: (index) {
              if (index == 0) {
                Navigator.pop(context);
              } else if (index == 1) {
                Navigator.pushNamed(context, SearchView.routeName);
              } else if (index == 2) {
                Navigator.pushNamed(context, WhishlistView.routeName);
              } else if (index == 3) {
                Navigator.pushNamed(context, ProfileView.routeName);
              }
            },
          ),
        ),
      ),
    );
  }
}
