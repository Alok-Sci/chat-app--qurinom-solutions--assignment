import 'package:chat_app__qurinom_solutions__assignment/core/utils/helpers.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/home/models/chat_model.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/chat/views/chat_screen.dart';
import 'package:chat_app__qurinom_solutions__assignment/core/utils/extensions/build_context.extension.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/login/bloc/login_bloc.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/login/bloc/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({
    super.key,
    required this.chat,
  });

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    final user = (context.read<LoginBloc>().state as LoginSuccess).user;
    final uniqueParticipants =
        chat.participants.where((u) => u.id != user.id).toList();
    final uniqueParticipantsName = uniqueParticipants.map((p) => p.name).join(", ");

    return GestureDetector(
      onTap: () {
        // TODO: navigate to chat detail screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ChatScreen(
                chat.id,
                participants: uniqueParticipants,
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
                    uniqueParticipantsName == ""
                        ? "You"
                        : uniqueParticipantsName,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                  SizedBox(
                    width: 270,
                    child: Text(
                      getTitleForLastMessage(chat.lastMessage),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: true,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.inversePrimary,
                      ),
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
