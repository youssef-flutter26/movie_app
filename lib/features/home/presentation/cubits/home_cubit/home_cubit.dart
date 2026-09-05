import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/models/movie_model.dart';
import 'package:movie_app/core/models/genre_model.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';
import 'package:movie_app/features/home/presentation/cubits/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  final HomeRepo homeRepo;

  Future<void> fetchHomeData() async {
    emit(HomeLoading());

    var nowPlayingResult = await homeRepo.getNowPlayingMovies();
    var popularResult = await homeRepo.getPopularMovies();
    var genresResult = await homeRepo.getGenres();

    if (isClosed) return;

    List<MovieModel> nowPlaying = [];
    List<MovieModel> popular = [];
    List<GenreModel> genresList = [];
    String? errorMessage;

    nowPlayingResult.fold(
      (failure) => errorMessage = failure.message,
      (movies) => nowPlaying = movies,
    );

    popularResult.fold(
      (failure) => errorMessage ??= failure.message,
      (movies) => popular = movies,
    );

    genresResult.fold(
      (failure) => errorMessage ??= failure.message,
      (genres) => genresList = genres,
    );

    if (errorMessage != null) {
      emit(HomeFailure(errorMessage!));
    } else {
      emit(
        HomeSuccess(
          nowPlayingMovies: nowPlaying,
          popularMovies: popular,
          genres: genresList,
        ),
      );
    }
  }

  Future<void> fetchMoviesByGenre({required int genreId}) async {
    var result = await homeRepo.getMoviesByGenre(genreId);

    if (isClosed) return;

    result.fold((failure) => emit(HomeFailure(failure.message)), (movies) {
      if (state is HomeSuccess) {
        final currentState = state as HomeSuccess;
        emit(
          HomeSuccess(
            nowPlayingMovies: currentState.nowPlayingMovies,
            popularMovies: movies,
            genres: currentState.genres,
          ),
        );
      }
    });
  }
}
