class ChatModel {
  final String senderName;
  final String senderEmail;
  final String? recieverName;
  final String? recieverEmail;

  ChatModel({
    required this.senderName,
    required this.senderEmail,
    this.recieverName,
    this.recieverEmail,
  });
}