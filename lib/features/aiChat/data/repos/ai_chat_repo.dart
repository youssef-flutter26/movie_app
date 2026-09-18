import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';

abstract class AiChatRepo {
  Future<Either<Failure, String>> getMovieRecommendation(String prompt);
}
