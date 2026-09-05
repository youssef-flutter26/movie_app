import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/features/details/data/models/movie_details.dart';

abstract class MovieDetailsRepo {
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(int movieId);
}
