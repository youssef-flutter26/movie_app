import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/core/models/genre_model.dart';
import 'package:movie_app/core/models/movie_model.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';
import 'package:movie_app/features/home/data_source.dart/home_api_service.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeApiService homeApiService;

  HomeRepoImpl(this.homeApiService);
  @override
  Future<Either<Failure, List<GenreModel>>> getGenres() async {
    // TODO: implement getGenres
    try {
      var data = await homeApiService.get(
        endPoint: 'genre/movie/list?language=en',
      );

      List<GenreModel> genres = [];
      for (var item in data['genres']) {
        genres.add(GenreModel.fromJson(item));
      }

      return right(genres);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getPopularMovies() async {
    // TODO: implement getPopularMovies
    try {
      var data = await homeApiService.get(
        endPoint: 'movie/popular?language=en-US&page=1',
      );

      List<MovieModel> movies = [];
      for (var item in data['results']) {
        movies.add(MovieModel.fromJson(item));
      }

      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies() async {
    try {
      var data = await homeApiService.get(
        endPoint: 'movie/now_playing?language=en-US&page=1',
      );

      List<MovieModel> movies = [];
      for (var item in data['results']) {
        movies.add(MovieModel.fromJson(item));
      }

      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  @override
  Future<Either<Failure, List<MovieModel>>> getMoviesByGenre(
    int genreId,
  ) async {
    try {
      var data = await homeApiService.get(
        endPoint: 'discover/movie?with_genres=$genreId',
      );
      List<MovieModel> movies = [];
      for (var item in data['results']) {
        movies.add(MovieModel.fromJson(item));
      }
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
