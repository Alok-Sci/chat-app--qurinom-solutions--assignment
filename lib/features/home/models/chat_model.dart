import 'package:chat_app__qurinom_solutions__assignment/features/login/models/user_model.dart';

class Chat {
  final String id;
  final bool isGroupChat;
  final List<User> participants;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final LastMessage lastMessage;

  Chat({
    required this.id,
    required this.isGroupChat,
    required this.participants,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.lastMessage,
  });

  Chat copyWith({
    String? id,
    bool? isGroupChat,
    List<User>? participants,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    LastMessage? lastMessage,
  }) =>
      Chat(
        id: id ?? this.id,
        isGroupChat: isGroupChat ?? this.isGroupChat,
        participants: participants ?? this.participants,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        lastMessage: lastMessage ?? this.lastMessage,
      );

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json["_id"],
        isGroupChat: json["isGroupChat"],
        participants:
            List<User>.from(json["participants"].map((x) => User.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        lastMessage: LastMessage.fromJson(json["lastMessage"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "isGroupChat": isGroupChat,
        "participants": List<dynamic>.from(participants.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "lastMessage": lastMessage.toJson(),
      };
}

class LastMessage {
  final String id;
  final String senderId;
  final String content;
  final String messageType;
  final String? fileUrl;
  final DateTime createdAt;

  LastMessage({
    required this.id,
    required this.senderId,
    required this.content,
    required this.messageType,
    this.fileUrl,
    required this.createdAt,
  });

  LastMessage copyWith({
    String? id,
    String? senderId,
    String? content,
    String? messageType,
    String? fileUrl,
    DateTime? createdAt,
  }) =>
      LastMessage(
        id: id ?? this.id,
        senderId: senderId ?? this.senderId,
        content: content ?? this.content,
        messageType: messageType ?? this.messageType,
        fileUrl: fileUrl ?? this.fileUrl,
        createdAt: createdAt ?? this.createdAt,
      );

  factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
        id: json["_id"],
        senderId: json["senderId"],
        content: json["content"],
        messageType: json["messageType"],
        fileUrl: json["fileUrl"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "senderId": senderId,
        "content": content,
        "messageType": messageType,
        "fileUrl": fileUrl,
        "createdAt": createdAt.toIso8601String(),
      };
}
