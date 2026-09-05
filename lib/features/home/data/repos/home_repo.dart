import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/core/models/genre_model.dart';
import 'package:movie_app/core/models/movie_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieModel>>> getPopularMovies();
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies();
  Future<Either<Failure, List<GenreModel>>> getGenres();
  Future<Either<Failure, List<MovieModel>>> getMoviesByGenre(int genreId);
}
