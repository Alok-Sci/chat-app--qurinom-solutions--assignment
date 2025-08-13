import 'package:chat_app__qurinom_solutions__assignment/features/home/models/chat_model.dart';

sealed class ChatListState {}

class ChatListInitial extends ChatListState {}

class ChatListLoading extends ChatListState {}
class ChatListLoaded extends ChatListState {
  final List<Chat> chats;
  ChatListLoaded(this.chats);
}
class ChatListError extends ChatListState {
  final String error;
  ChatListError(this.error);
}
