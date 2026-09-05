import 'package:movie_app/core/models/genre_model.dart';
import 'package:movie_app/core/models/movie_model.dart';
import 'package:movie_app/features/search/data/models/actor_model.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchGenresSuccess extends SearchState {
  final List<GenreModel> genres;
  SearchGenresSuccess(this.genres);
}

class SearchMultiSuccess extends SearchState {
  final List<MovieModel> movies;
  final List<ActorModel> actors;
  SearchMultiSuccess({required this.movies, required this.actors});
}

class SearchDiscoverSuccess extends SearchState {
  final List<MovieModel> movies;
  SearchDiscoverSuccess(this.movies);
}

class SearchFailure extends SearchState {
  final String errMessage;
  SearchFailure(this.errMessage);
}
