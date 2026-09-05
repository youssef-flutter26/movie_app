import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/core/models/genre_model.dart';
import 'package:movie_app/core/models/movie_model.dart';
import 'package:movie_app/features/search/data/models/actor_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, (List<MovieModel> movies, List<ActorModel> actors)>>
  searchMulti({required String query});

  Future<Either<Failure, List<MovieModel>>> discoverMoviesByGenre({
    required int genreId,
  });

  Future<Either<Failure, List<GenreModel>>> getSearchGenres();
}
