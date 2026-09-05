import 'package:flutter/material.dart';
import 'package:movie_app/core/models/movie_model.dart';
import 'package:movie_app/features/search/data/models/actor_model.dart';
import 'package:movie_app/features/search/presentation/widgets/search_result_body.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({
    super.key,
    this.movies = const [],
    this.actors = const [],
  });

  final List<MovieModel> movies;
  final List<ActorModel> actors;

  static const String routeName = 'search_result';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SearchResultBody(movies: movies, actors: actors),
      ),
    );
  }
}
