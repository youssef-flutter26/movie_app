import 'package:movie_app/core/models/genre_model.dart';
import 'package:movie_app/core/models/movie_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<MovieModel> nowPlayingMovies;
  final List<MovieModel> popularMovies;
  final List<GenreModel> genres;

  HomeSuccess({
    required this.nowPlayingMovies,
    required this.popularMovies,
    required this.genres,
  });
}

class HomeFailure extends HomeState {
  final String message;
  HomeFailure(this.message);
}
