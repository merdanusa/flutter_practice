class ChatMessage {
  final String text;
  final bool isMe;
  final DateTime timestamp;
  final String? senderName;

  ChatMessage({
    required this.text,
    required this.isMe,
    DateTime? timestamp,
    this.senderName,
  }) : timestamp = timestamp ?? DateTime.now();
}
