
import 'package:chat_app__qurinom_solutions__assignment/core/extensions/build_context.extension.dart';
import 'package:flutter/material.dart';

class SendMessageBottomBar extends StatelessWidget {
  const SendMessageBottomBar({
    super.key,
    required this.controller,
    required this.onMessageSend,
  });

  final TextEditingController controller;
  final Function(String message) onMessageSend;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 15),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 20),
              hintText: "Type a message",
              hintStyle: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.primary,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: BorderSide(width: 3),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide:
                    BorderSide(color: context.colorScheme.primary, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide:
                    BorderSide(color: context.colorScheme.primary, width: 3),
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.telegram,
            size: 55,
            color: context.colorScheme.primary,
          ),
          onPressed: () => onMessageSend(controller.text),
        )
      ],
    );
  }
}
