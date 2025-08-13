import 'package:chat_app__qurinom_solutions__assignment/features/home/models/chat_model.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/chat/models/message_model.dart';

sealed class ChatState {}

class ChatInitial extends ChatState {}

class ChatListLoading extends ChatState {}
class ChatListLoaded extends ChatState {
  final List<Chat> chats;
  ChatListLoaded(this.chats);
}
class ChatListError extends ChatState {
  final String error;
  ChatListError(this.error);
}

class ChatMessagesLoading extends ChatState {}
class ChatMessagesLoaded extends ChatState {
  final List<Message> messages;
  ChatMessagesLoaded(this.messages);
}
class ChatMessagesError extends ChatState {
  final String error;
  ChatMessagesError(this.error);
}

class SendingMessage extends ChatState {}
class MessageSent extends ChatState {
  final Message message;
  MessageSent(this.message);
}
class SendMessageError extends ChatState {
  final String error;
  SendMessageError(this.error);
}
