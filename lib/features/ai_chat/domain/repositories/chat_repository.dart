import 'package:dartz/dartz.dart';
import 'package:syria_glow/core/errors/failure.dart';
import 'package:syria_glow/features/ai_chat/domain/entities/message_entity.dart';

abstract class ChatRepository {
  Future<Either<Failure,MessageEntity>> sendMessage(String prompt);
}