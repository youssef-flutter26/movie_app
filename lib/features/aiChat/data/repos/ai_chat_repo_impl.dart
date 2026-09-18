import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/features/aiChat/data/repos/ai_chat_repo.dart';
import 'package:movie_app/features/aiChat/data_source/ai_api_service.dart';

class AiChatRepoImpl implements AiChatRepo {
  final AiApiService aiApiService;

  AiChatRepoImpl(this.aiApiService);

  @override
  Future<Either<Failure, String>> getMovieRecommendation(String prompt) async {
    try {
      final result = await aiApiService.fetchAiResponse(prompt);
      if (result != null) {
        return right(result);
      } else {
        return left(ServerFailure('No response generated.'));
      }
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
