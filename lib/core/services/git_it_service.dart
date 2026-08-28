import 'package:get_it/get_it.dart';
import 'package:movie_app/core/services/firebase_auth_service.dart';
import 'package:movie_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:movie_app/features/auth/domain/repos/auth_repo.dart';
import 'package:movie_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(firebaseAuthService: getIt<FirebaseAuthService>()),
  );
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<AuthRepo>()));
}
