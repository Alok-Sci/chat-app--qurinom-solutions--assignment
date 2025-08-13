import 'package:chat_app__qurinom_solutions__assignment/core/api/api_service.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/home/models/chat_model.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/home/bloc/chat_list_events.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/home/bloc/chat_list_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  final ApiService api;

  ChatListBloc({required this.api}) : super(ChatListInitial()) {
    on<FetchChatList>(_onFetchUserChats);
  }

  Future<void> _onFetchUserChats(FetchChatList event, Emitter emit) async {
    emit(ChatListLoading());
    try {
      final jsonList = await api.getUserChats(event.userId);
      emit(ChatListLoaded(
          jsonList.map<Chat>((json) => Chat.fromJson(json)).toList()));
    } catch (err) {
      emit(ChatListError(err.toString()));
    }
  }
}
