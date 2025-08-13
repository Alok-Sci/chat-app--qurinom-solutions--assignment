import 'package:chat_app__qurinom_solutions__assignment/core/utils/extensions/build_context.extension.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/chat/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.isSent,
    required this.message,
  });

  final bool isSent;
  final Message message;

  Widget _buildTick(Message message, BuildContext context) {
    return switch (message.status) {
      'sent' => Icon(Icons.check_rounded, color: Colors.grey, size: 16),
      'delivered' => Icon(Icons.check_rounded, color: Colors.grey),
      'seen' => Stack(
          children: [
            Positioned(
              child: Icon(
                Icons.check,
                color: context.colorScheme.onPrimary,
                size: 16,
              ),
            ),
            Positioned(
              left: 5,
              child: Icon(
                Icons.check,
                color: context.colorScheme.onPrimary,
                size: 16,
              ),
            )
          ],
        ),
      _ => Icon(
          Icons.access_time,
          color: Colors.grey,
          size: 16,
        )
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: isSent ? 0 : 30,
        left: isSent ? 30 : 0,
      ),
      child: Card(
        color: isSent
            ? context.colorScheme.primary
            : context.colorScheme.primaryFixedDim,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),
          child: Column(
            crossAxisAlignment:
                isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              message.messageType == "image"
                  ? Image.network(
                      message.content,
                      width: 200,
                      height: 200,
                    )
                  : Text(
                      message.content,
                      style: context.textTheme.titleMedium
                          ?.copyWith(color: context.colorScheme.onPrimary),
                    ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment:
                    isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    DateFormat.yMMMMEEEEd().format(message.sentAt),
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onPrimary,
                    ),
                  ),
                  SizedBox(width: 10),
                  _buildTick(message, context),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
