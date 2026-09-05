import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/features/details/presentation/cubits/cubit/movie_details_cubit.dart';
import 'package:movie_app/features/details/presentation/widgets/play_and_install.dart';
import 'package:movie_app/features/details/presentation/widgets/rating.dart';
import 'package:movie_app/features/details/presentation/widgets/time_movie.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        if (state is MovieDetailsSuccess) {
          final movie = state.movieDetails;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 30.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                      height: 250.h,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image, size: 100),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                TimeMovie(movie: movie),
                Rating(voteAverage: movie.voteAverage ?? 0.0),
                SizedBox(height: 20.h),
                const PlayAndInstall(),
                SizedBox(height: 20.h),
                Text('Story Line', style: TextStyles.bold23),
                SizedBox(height: 10.h),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: movie.overview ?? '',
                        style: TextStyles.regular13.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is MovieDetailsFailure) {
          return Center(child: Text(state.message, style: TextStyles.bold19));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
