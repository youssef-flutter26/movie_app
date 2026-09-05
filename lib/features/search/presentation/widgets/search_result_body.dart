import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/models/movie_model.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/features/search/data/models/actor_model.dart';
import 'package:movie_app/features/search/presentation/cubits/search_cubit/search_cubit_cubit.dart';
import 'package:movie_app/features/search/presentation/widgets/todary_card.dart';

class SearchResultBody extends StatelessWidget {
  const SearchResultBody({
    super.key,
    this.movies = const [],
    this.actors = const [],
  });

  final List<MovieModel> movies;
  final List<ActorModel> actors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            TextButton(
              onPressed: () {
                BlocProvider.of<SearchCubit>(context).fetchSearchGenres();
              },
              child: Text('Cancel', style: TextStyles.bold16),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: TodayCard(movie: movies[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
