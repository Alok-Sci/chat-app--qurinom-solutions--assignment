import 'package:chat_app__qurinom_solutions__assignment/core/utils/extensions/build_context.extension.dart';
import 'package:chat_app__qurinom_solutions__assignment/core/widgets/chat_bubble.dart';
import 'package:chat_app__qurinom_solutions__assignment/core/widgets/send_message_bottom_bar.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/chat/bloc/chat_bloc.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/chat/bloc/chat_events.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/chat/bloc/chat_states.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/chat/models/message_model.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/login/bloc/login_bloc.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/login/bloc/login_states.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/login/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen(
    this.chatId, {
    required this.participants,
    super.key,
  });

  final List<User> participants;
  final String chatId;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();

  final List<Message> messages = [];

  bool _isSent(Message message) {
    return message.senderId ==
        (context.read<LoginBloc>().state as LoginSuccess).user.id;
  }

  final ScrollController _scrollController = ScrollController();

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // scroll to bottom
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void initState() {
    super.initState();

    // get the chat history by chatId
    context.read<ChatBloc>().add(FetchChatMessages(widget.chatId));
  }

  @override
  void dispose() {
    messageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = (context.read<LoginBloc>().state as LoginSuccess).user;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      return scrollToBottom();
    });

    return Scaffold(
      appBar: AppBar(
        foregroundColor: context.colorScheme.onPrimary,
        centerTitle: true,
        backgroundColor: context.colorScheme.primary,
        title: Column(
          children: [
            Text(
              widget.participants.map((p) => p.name).join(', ').toString(),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<ChatBloc, ChatState>(
          listener: (context, state) {
            if (state is MessageSent || state is ChatMessagesLoaded) {
              scrollToBottom();
            }
            if (state is SendMessageError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            // chat messages loading state
            if (state is ChatMessagesLoading) {
              return Center(child: CircularProgressIndicator.adaptive());
            }

            // chat message loaded state
            else if (state is ChatMessagesLoaded ||
                state is SendingMessage ||
                state is MessageSent ||
                state is SendMessageError) {
              final messages = state is ChatMessagesLoaded
                  ? state.messages
                  : context.read<ChatBloc>().currentMessages;

              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      shrinkWrap: true,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        final isSent = _isSent(message);
                        return Align(
                          alignment: isSent
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: ChatBubble(isSent: isSent, message: message),
                        );
                      },
                    ),
                  ),
                  SendMessageBottomBar(
                    controller: messageController,
                    onMessageSend: (message) {
                      if (message.trim().isEmpty) return;
                      context.read<ChatBloc>().add(
                            SendMessageEvent(
                              chatId: widget.chatId,
                              senderId: (context.read<LoginBloc>().state
                                      as LoginSuccess)
                                  .user
                                  .id,
                              content: message.trim(),
                              messageType: "text",
                            ),
                          );
                      messageController.clear();
                    },
                  ),
                ],
              );
            }

            // chat messages error state
            else if (state is ChatMessagesError) {
              final error = state.error;
              return Center(child: Text("Error: $error"));
            }

            return SizedBox();
          },
        ),
      ),
    );
  }
}
