import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/features/ai_chat/domain/entities/message_entity.dart';
import 'package:syria_glow/features/ai_chat/domain/repositories/chat_repository.dart';
import 'package:syria_glow/features/ai_chat/presentation/manager/ai_chat/ai_chat_state.dart';

class AiChatCubit extends Cubit<AiChatState> {
  final ChatRepository chatRepository;
  AiChatCubit(this.chatRepository) : super(AiChatInitial(const []));

  final List<MessageEntity> _messages = [];

  void initConversation(String welcomeText) {
    if (_messages.isNotEmpty) return;

    final welcomeMsg = MessageEntity(
      text: welcomeText,
      sender: MessageSender.ai,
    );

    _messages.add(welcomeMsg);
    emit(AiChatSuccess(List.from(_messages)));
  }

  Future<void> sendUserMessage(String text) async {
    final trimedText = text.trim();
    if (trimedText.isEmpty) return;

    final userMessage = MessageEntity(
      text: trimedText,
      sender: MessageSender.user,
    );
    _messages.add(userMessage);
    emit(AiChatLoading(List.from(_messages)));

    final aiMessage = await chatRepository.sendMessage(trimedText);
    aiMessage.fold(
      (failure) =>
          emit(AiChatFailure(List.from(_messages), message: failure.message)),
      (message) {
        _messages.add(message);
        emit(AiChatSuccess(List.from(_messages)));
      },
    );
  }
}
