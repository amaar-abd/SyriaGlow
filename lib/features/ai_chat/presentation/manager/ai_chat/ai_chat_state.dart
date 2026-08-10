import 'package:syria_glow/features/ai_chat/domain/entities/message_entity.dart';

class AiChatState {
  final List<MessageEntity> messages;

  const AiChatState(this.messages);
}

final class AiChatInitial extends AiChatState {
  AiChatInitial(super.messages);
}

final class AiChatLoading extends AiChatState {
  AiChatLoading(super.messages);
}

final class AiChatSuccess extends AiChatState {
  AiChatSuccess(super.messages);
}

final class AiChatFailure extends AiChatState {
  final String message;

  AiChatFailure(super.messages, {required this.message});
}
