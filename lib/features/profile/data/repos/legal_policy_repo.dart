import 'package:dartz/dartz.dart';
import 'package:movie_app/features/profile/data/models/legal_policy_model.dart';
import 'package:movie_app/features/profile/data_source/profile_api_service.dart';

abstract class LegalPolicyRepo {
  Future<Either<String, LegalPolicyModel>> getLegalPolicy();
}

class LegalPolicyRepoImpl implements LegalPolicyRepo {
  final ProfileApiService profileApiService;

  LegalPolicyRepoImpl(this.profileApiService);

  @override
  Future<Either<String, LegalPolicyModel>> getLegalPolicy() async {
    try {
      // محاكاة طلب السيرفر لتجنب خطأ 401/404 من TMDB
      await Future.delayed(const Duration(milliseconds: 600));

      final mockResponse = {
        "title": "Terms & Privacy Policy",
        "content": "Welcome to Movie App. We respect your privacy and process minimal user data required for application functionalities. This product uses the TMDB API but is not endorsed or certified by TMDB.",
      };

      var policy = LegalPolicyModel.fromJson(mockResponse);
      return Right(policy);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
