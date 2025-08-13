import 'package:chat_app__qurinom_solutions__assignment/core/extensions/build_context.extension.dart';
import 'package:chat_app__qurinom_solutions__assignment/widgets/send_message_bottom_bar.dart';
import 'package:flutter/material.dart';

class MessageModel {
  MessageModel({
    required this.text,
    required this.senderEmail,
  });

  final String text;
  final String senderEmail;
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    required this.userName,
    required this.userEmail,
  });

  final String userName;
  final String userEmail;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();

  final List<MessageModel> messages = [
    MessageModel(text: "Hi", senderEmail: "corporate.alok@gmail.com"),
    MessageModel(text: "Hello", senderEmail: "swaroop.vass@gmail.com"),
    MessageModel(text: "Wassup!", senderEmail: "corporate.alok@gmail.com"),
    MessageModel(
        text: "Are you okay?", senderEmail: "corporate.alok@gmail.com"),
  ];

  bool _isSent(MessageModel message) {
    return message.senderEmail == "swaroop.vass@gmail.com";
  }

  @override
  void dispose() {
    messageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: context.colorScheme.onPrimary,
        centerTitle: true,
        backgroundColor: context.colorScheme.primary,
        title: Column(
          children: [
            Text(
              widget.userName,
              style: context.textTheme.titleLarge?.copyWith(
                color: context.colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.userEmail,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final item = messages[index];
                  final isSent = _isSent(item);
                  return Align(
                    alignment:
                        isSent ? Alignment.centerRight : Alignment.centerLeft,
                    child: Card(
                      color: isSent
                          ? context.colorScheme.primary
                          : context.colorScheme.primaryFixedDim,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                        child: Text(
                          item.text,
                          style: context.textTheme.titleMedium
                              ?.copyWith(color: context.colorScheme.onPrimary),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SendMessageBottomBar(
              controller: messageController,
              onMessageSend: (message) {
                // TODO: call api

                // TODO: add sent message to the chat message list

                // clear textfield
                messageController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
