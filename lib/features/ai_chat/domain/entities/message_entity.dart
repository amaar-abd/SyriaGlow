enum MessageSender { user, ai }

class MessageEntity {
  final String text;
  final MessageSender sender;
  final DateTime timestamp;

  MessageEntity({required this.text, required this.sender, DateTime? timestamp})
    : timestamp = timestamp ?? DateTime.now();
}
