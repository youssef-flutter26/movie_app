import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/models/movie_model.dart';
import 'package:movie_app/features/details/presentation/views/movie_details.dart';
import 'package:movie_app/features/home/presentation/widgets/category_card.dart';

class FeaturedMostPopularListView extends StatelessWidget {
  final List<MovieModel> movies;

  const FeaturedMostPopularListView({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                MovieDetails.routeName,
                arguments: movie.id, // Pass the movie ID to the details page
              );
            },
            child: CategoryCard(movie: movie),
          );
        },
      ),
    );
  }
}
