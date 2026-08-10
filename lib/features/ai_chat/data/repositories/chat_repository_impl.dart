import 'package:dartz/dartz.dart';
import 'package:syria_glow/core/errors/failure.dart';
import 'package:syria_glow/features/ai_chat/data/datasource/ai_remote_data_source.dart';
import 'package:syria_glow/features/ai_chat/domain/entities/message_entity.dart';
import 'package:syria_glow/features/ai_chat/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final AiRemoteDataSource remoteDataSource;

  const ChatRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, MessageEntity>> sendMessage(String prompt) async {
    try {
      final response = await remoteDataSource.sendMessage(prompt);
      if (response == null || response.trim().isEmpty) {
        return left(
          ServerFailure(
            message: 'لم أتمكن من الحصول على رد، يرجى المحاولة لاحقاً.',
          ),
        );
      }
      return right(MessageEntity(text: response, sender: MessageSender.ai));
    } catch (e) {
      return left(ServerFailure(message: 'حدث خطأ أثناء التواصل مع حر: $e'));
    }
  }
}
