import 'package:get_it/get_it.dart';
import 'package:movie_app/core/services/firebase_auth_service.dart';
import 'package:movie_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:movie_app/features/auth/domain/repos/auth_repo.dart';
import 'package:movie_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:movie_app/features/details/data/repos/movie_details_impl.dart';
import 'package:movie_app/features/details/data/repos/movie_details_repo.dart';
import 'package:movie_app/features/details/data_source/movie_details_api_service.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';
import 'package:movie_app/features/home/data/repos/home_repo_impl.dart';
import 'package:movie_app/features/home/data_source.dart/home_api_service.dart';
import 'package:movie_app/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:movie_app/features/search/data/search_repo_impl.dart';
import 'package:movie_app/features/search/data/serch_repo.dart';
import 'package:movie_app/features/search/data_source/search_api_service.dart';
import 'package:movie_app/features/search/presentation/cubits/search_cubit/search_cubit_cubit.dart';
import 'package:dio/dio.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<HomeApiService>(HomeApiService(getIt<Dio>()));
  getIt.registerSingleton<SearchApiService>(SearchApiService(getIt<Dio>()));
  getIt.registerSingleton<MovieDetailsApiService>(
    MovieDetailsApiService(getIt<Dio>()),
  );
  getIt.registerSingleton<MovieDetailsRepo>(
    MovieDetailsImpl(getIt<MovieDetailsApiService>()),
  );

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(firebaseAuthService: getIt<FirebaseAuthService>()),
  );
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<AuthRepo>()));

  getIt.registerSingleton<HomeRepo>(HomeRepoImpl(getIt<HomeApiService>()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));

  getIt.registerSingleton<SearchRepo>(
    SearchRepoImpl(getIt<SearchApiService>()),
  );
  getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt<SearchRepo>()));
}
