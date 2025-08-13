import 'package:chat_app__qurinom_solutions__assignment/features/home/models/chat_model.dart';

String getTitleForLastMessage(LastMessage message) {
  return switch (message.messageType) {
    "video" => "📽️",
    "audio" => "🔉",
    "image" => "🖼️",
    _ => message.content
  };
}
