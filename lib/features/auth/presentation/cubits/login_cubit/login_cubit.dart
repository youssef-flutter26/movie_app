import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/auth/domain/entities/user_entity.dart';
import 'package:movie_app/features/auth/domain/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  AuthRepo authRepo;
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    emit(LoginLoading());
    final result = await authRepo.loginWithEmailAndPassword(email, password);

    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    final result = await authRepo.signInWithGoogle();

    result.fold((failure) {
      log('=== GOOGLE SIGN IN ERROR: ${failure.message} ===');
      emit(LoginFailure(message: failure.message));
    }, (userEntity) => emit(LoginSuccess(userEntity: userEntity)));
  }

  Future<void> signInWithFacebook() async {
    emit(LoginLoading());
    final result = await authRepo.signInWithFacebook();

    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
    );
  }
}
