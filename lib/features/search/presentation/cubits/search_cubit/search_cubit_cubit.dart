import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/models/genre_model.dart';
import 'package:movie_app/features/search/data/serch_repo.dart';
import 'package:movie_app/features/search/presentation/cubits/search_cubit/search_cubit_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;
  List<GenreModel> storedGenres = [];

  Future<void> fetchSearchGenres() async {
    emit(SearchLoading());
    var genresResult = await searchRepo.getSearchGenres();

    if (isClosed) return;

    genresResult.fold((failure) => emit(SearchFailure(failure.message)), (
      genres,
    ) async {
      storedGenres = genres;
      emit(SearchGenresSuccess(genres));

      if (genres.isNotEmpty && genres.first.id != null) {
        var moviesResult = await searchRepo.discoverMoviesByGenre(
          genreId: genres.first.id!,
        );
        if (isClosed) return;
        moviesResult.fold(
          (failure) => null,
          (movies) => emit(SearchDiscoverSuccess(movies)),
        );
      }
    });
  }

  Future<void> searchMulti({required String query}) async {
    if (query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());
    var result = await searchRepo.searchMulti(query: query);

    if (isClosed) return;

    result.fold(
      (failure) => emit(SearchFailure(failure.message)),
      (data) => emit(SearchMultiSuccess(movies: data.$1, actors: data.$2)),
    );
  }

  Future<void> discoverMoviesByGenre({required int genreId}) async {
    emit(SearchLoading());
    var result = await searchRepo.discoverMoviesByGenre(genreId: genreId);

    if (isClosed) return;

    result.fold(
      (failure) => emit(SearchFailure(failure.message)),
      (movies) => emit(SearchDiscoverSuccess(movies)),
    );
  }
}
