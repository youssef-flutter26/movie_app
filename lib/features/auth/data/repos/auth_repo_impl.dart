import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/core/services/firebase_auth_service.dart';
import 'package:movie_app/features/auth/data/models/user_model.dart';
import 'package:movie_app/features/auth/domain/entities/user_entity.dart';
import 'package:movie_app/features/auth/presentation/widgets/sign_up_view_body.dart';

import '../../domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure('حدث خطأ غير متوقع، برجاء المحاولة لاحقاً'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure('حدث خطأ غير متوقع، برجاء المحاولة لاحقاً'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user!));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e, stackTrace) {
      log('===ACTUAL ERROR IS $e ===');
      log('===STACKTRACE IS $stackTrace===');

      return left(ServerFailure('حدث خطأ غير متوقع، برجاء المحاولة لاحقاً'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return right(UserModel.fromFirebaseUser(user!));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e, stackTrace) {
      log('===ACTUAL ERROR IS $e ===');
      log('===STACKTRACE IS $stackTrace===');

      return left(ServerFailure('حدث خطأ غير متوقع، برجاء المحاولة لاحقاً'));
    }
  }
}
