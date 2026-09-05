import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/details/data/models/movie_details.dart';
import 'package:movie_app/features/details/data/repos/movie_details_repo.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit(this.movieDetailsRepo) : super(MovieDetailsInitial());

  final MovieDetailsRepo movieDetailsRepo;

  Future<void> getMovieDetails(int id) async {
    emit(MovieDetailsLoading());

    try {
      var result = await movieDetailsRepo.getMovieDetails(id);

      if (isClosed) return;

      result.fold(
        (failure) => emit(MovieDetailsFailure(failure.message)),
        (movieDetails) => emit(MovieDetailsSuccess(movieDetails)),
      );
    } catch (e) {
      if (isClosed) return;
      emit(MovieDetailsFailure(e.toString()));
    }
  }
}
