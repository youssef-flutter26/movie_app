import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/features/profile/data/models/user_model.dart';
import 'package:movie_app/features/profile/data/repos/profile_repo.dart';
import 'package:movie_app/features/profile/data_source/profile_api_service.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileApiService profileApiService;

  ProfileRepoImpl(this.profileApiService);

  @override
  Future<Either<Failure, UserModel>> getUserProfile({
    required String token,
  }) async {
    try {
      var data = await profileApiService.getUserProfile(token: token);
      UserModel userModel = UserModel.fromJson(data);
      return Right(userModel);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateUserProfile({
    required UserModel userModel,
    required String token,
  }) async {
    try {
      var data = await profileApiService.updateUserProfile(
        data: userModel.toJson(),
        token: token,
      );
      UserModel updatedUser = UserModel.fromJson(data);
      return Right(updatedUser);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout({required String token}) async {
    try {
      await profileApiService.logout(token: token);
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
