import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/features/profile/data/models/user_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserModel>> getUserProfile({required String token});

  Future<Either<Failure, UserModel>> updateUserProfile({
    required UserModel userModel,
    required String token,
  });

  Future<Either<Failure, void>> logout({required String token});
}
