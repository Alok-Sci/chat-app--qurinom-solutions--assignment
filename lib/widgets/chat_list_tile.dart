import 'package:chat_app__qurinom_solutions__assignment/chat_model.dart';
import 'package:chat_app__qurinom_solutions__assignment/chat_screen.dart';
import 'package:chat_app__qurinom_solutions__assignment/core/extensions/build_context.extension.dart';
import 'package:flutter/material.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({super.key, required this.chat});

  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: navigate to chat detail screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ChatScreen(
                userName: chat.senderName,
                userEmail: chat.senderEmail,
              );
            },
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                child: Icon(
                  Icons.person_2_rounded,
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.senderName,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                  Text(
                    chat.senderEmail,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.inversePrimary,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
