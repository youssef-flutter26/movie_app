import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/core/models/genre_model.dart';
import 'package:movie_app/core/models/movie_model.dart';
import 'package:movie_app/features/search/data/models/actor_model.dart';
import 'package:movie_app/features/search/data/serch_repo.dart';
import 'package:movie_app/features/search/data_source/search_api_service.dart';

class SearchRepoImpl implements SearchRepo {
  final SearchApiService searchApiService;

  SearchRepoImpl(this.searchApiService);

  @override
  Future<Either<Failure, (List<MovieModel> movies, List<ActorModel> actors)>>
  searchMulti({required String query}) async {
    try {
      var data = await searchApiService.get(
        endPoint: 'search/multi',
        queryParameters: {'query': query},
      );

      List<MovieModel> movies = [];
      List<ActorModel> actors = [];

      for (var item in data['results']) {
        if (item['media_type'] == 'movie') {
          movies.add(MovieModel.fromJson(item));
        } else if (item['media_type'] == 'person') {
          actors.add(ActorModel.fromJson(item));
        }
      }

      return right((movies, actors));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> discoverMoviesByGenre({
    required int genreId,
  }) async {
    try {
      var data = await searchApiService.get(
        endPoint: 'discover/movie',
        queryParameters: {'with_genres': genreId},
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
  Future<Either<Failure, List<GenreModel>>> getSearchGenres() async {
    try {
      var data = await searchApiService.get(endPoint: 'genre/movie/list');

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
}
