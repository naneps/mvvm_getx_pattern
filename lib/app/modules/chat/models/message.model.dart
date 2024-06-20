class MessageModel {
  final String content;
  final bool isSentByMe;
  final DateTime timestamp;

  MessageModel({
    required this.content,
    required this.isSentByMe,
    required this.timestamp,
  });
}
