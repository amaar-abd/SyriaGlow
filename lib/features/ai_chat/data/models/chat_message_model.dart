import 'package:syria_glow/features/ai_chat/domain/entities/message_entity.dart';

class ChatMessageModel extends MessageEntity {
  ChatMessageModel({
    required super.text,
    required super.sender,
    super.timestamp,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      text: json['text'] ?? '',
      sender: json['sender'] == 'user' ? MessageSender.user : MessageSender.ai,
      timestamp: json['timestamp'] != null
          ? DateTime.parse(json['timestamp'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'sender': sender == MessageSender.user ? 'user' : 'ai',
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
