import 'dart:io';

import 'package:chat_app__qurinom_solutions__assignment/features/chat/models/message_model.dart';

sealed class ChatEvent {}

class FetchChatMessages extends ChatEvent {
  final String chatId;
  FetchChatMessages(this.chatId);
}

class SendMessageEvent extends ChatEvent {
  final String chatId;
  final String senderId;
  final String content;
  final String messageType;
  final File? file;
  SendMessageEvent({
    required this.chatId,
    required this.senderId,
    required this.content,
    required this.messageType,
    this.file,
  });
}

class ReceiveMessageEvent extends ChatEvent {
  final Message message;
  ReceiveMessageEvent(this.message);
}
