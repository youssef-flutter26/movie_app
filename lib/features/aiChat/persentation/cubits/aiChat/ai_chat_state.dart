part of 'ai_chat_cubit.dart';

@immutable
sealed class AiChatState {}

final class AiChatInitial extends AiChatState {}

final class AiChatLoading extends AiChatState {}

final class AiChatSuccess extends AiChatState {
  final List<MessageModel> messages;

  AiChatSuccess(this.messages);
}

final class AiChatFailure extends AiChatState {
  final String errMessage;

  AiChatFailure(this.errMessage);
}
