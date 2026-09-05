import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/models/movie_model.dart';
import 'package:movie_app/features/details/presentation/views/movie_details.dart';
import 'package:movie_app/features/search/data/models/actor_model.dart';
import 'package:movie_app/features/search/presentation/widgets/actors_list_view.dart';
import 'package:movie_app/features/search/presentation/widgets/todary_card.dart';

class SearchByActor extends StatelessWidget {
  final List<ActorModel> actors;
  final List<MovieModel> movies;

  const SearchByActor({
    super.key,
    required this.actors,
    this.movies = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Actors',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12.h),
        ActorsListView(actors: actors),
        SizedBox(height: 24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Movie Related',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'See All',
                style: TextStyle(color: Colors.blue, fontSize: 14.sp),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        if (movies.isNotEmpty)
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: movies.length,
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    MovieDetails.routeName,
                    arguments: movies[index].id,
                  );
                },
                child: TodayCard(movie: movies[index]),
              );
            },
          )
        else
          const SizedBox.shrink(),
      ],
    );
  }
}
