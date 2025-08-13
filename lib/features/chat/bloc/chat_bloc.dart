import 'package:chat_app__qurinom_solutions__assignment/core/api/api_service.dart';
// import 'package:chat_app__qurinom_solutions__assignment/core/web_socket/web_socket_service.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/chat/bloc/chat_events.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/chat/bloc/chat_states.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/chat/models/message_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ApiService api;
  // final WebSocketService socket;

  // Keep messages in memory for current chat
  List<Message> currentMessages = [];

  ChatBloc({
    required this.api,
    // required this.socket,
  }) : super(ChatInitial()) {
    on<FetchChatMessages>(_onFetchChatMessages);
    on<SendMessageEvent>(_onSendMessage);
    on<ReceiveMessageEvent>(_onReceiveMessage);

    // Listen to incoming messages from socket
    // socket.stream.listen((data) {
    //   final msg = Message.fromJson(data);
    //   add(ReceiveMessageEvent(msg));
    // });
  }

  Future<void> _onFetchChatMessages(
      FetchChatMessages event, Emitter emit) async {
    emit(ChatMessagesLoading());
    try {
      final jsonList = await api.getChatMessages(event.chatId);
      currentMessages =
          jsonList.map<Message>((json) => Message.fromJson(json)).toList();
      emit(ChatMessagesLoaded(currentMessages));
    } catch (err) {
      emit(ChatMessagesError(err.toString()));
    }
  }

  Future<void> _onSendMessage(SendMessageEvent event, Emitter emit) async {
    emit(SendingMessage());
    try {
      final json = await api.sendMessage(
        chatId: event.chatId,
        senderId: event.senderId,
        content: event.content,
        messageType: event.messageType,
        file: event.file,
      );
      final sentMsg = Message.fromJson(json);
      currentMessages.add(sentMsg);
      emit(MessageSent(sentMsg));
    } catch (err) {
      emit(SendMessageError(err.toString()));
    }
    emit(ChatMessagesLoaded(currentMessages));
  }

  void _onReceiveMessage(ReceiveMessageEvent event, Emitter emit) {
    currentMessages.add(event.message);
    emit(ChatMessagesLoaded(List.from(currentMessages)));
  }
}
