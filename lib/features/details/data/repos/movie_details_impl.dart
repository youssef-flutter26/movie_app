import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/features/details/data/models/movie_details.dart';
import 'package:movie_app/features/details/data/repos/movie_details_repo.dart';
import 'package:movie_app/features/details/data_source/movie_details_api_service.dart';

class MovieDetailsImpl implements MovieDetailsRepo {
  final MovieDetailsApiService movieDetailsApiService;

  MovieDetailsImpl(this.movieDetailsApiService);

  @override
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(
    int movieId,
  ) async {
    try {
      var data = await movieDetailsApiService.get(endPoint: 'movie/$movieId');
      MovieDetailsModel movieDetails = MovieDetailsModel.fromJson(data);
      return right(movieDetails);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
