import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/aiChat/data/repos/ai_chat_repo.dart';
import 'package:movie_app/features/aiChat/data/models/message_model.dart';

part 'ai_chat_state.dart';

class AiChatCubit extends Cubit<AiChatState> {
  final AiChatRepo aiChatRepo;
  final List<MessageModel> messages = [];

  AiChatCubit(this.aiChatRepo) : super(AiChatInitial());

  Future<void> sendMessage({required String prompt}) async {
    messages.add(MessageModel(message: prompt, isUser: true));
    emit(AiChatLoading());

    final result = await aiChatRepo.getMovieRecommendation(prompt);

    result.fold(
      (failure) {
        emit(AiChatFailure(failure.message));
      },
      (aiResponse) {
        messages.add(MessageModel(message: aiResponse, isUser: false));
        emit(AiChatSuccess(List.from(messages)));
      },
    );
  }
}
