import 'package:chat_app__qurinom_solutions__assignment/features/login/models/user_model.dart';

class Message {
  final String id;
  final String chatId;
  final String senderId;
  final String content;
  final String messageType;
  final List<dynamic> deletedBy;
  final String status;
  final dynamic deliveredAt;
  final DateTime? seenAt;
  final List<String> seenBy;
  final List<dynamic> reactions;
  final DateTime sentAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final String? fileUrl;
  final String? fileName;
  final int? fileSize;
  final Location? location;

  Message({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.content,
    required this.messageType,
    required this.deletedBy,
    required this.status,
    required this.deliveredAt,
    required this.seenAt,
    required this.seenBy,
    required this.reactions,
    required this.sentAt,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.fileUrl,
    this.fileName,
    this.fileSize,
    this.location,
  });

  Message copyWith({
    String? id,
    String? chatId,
    String? senderId,
    String? content,
    String? messageType,
    List<dynamic>? deletedBy,
    String? status,
    dynamic deliveredAt,
    DateTime? seenAt,
    List<String>? seenBy,
    List<dynamic>? reactions,
    DateTime? sentAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    String? fileUrl,
    String? fileName,
    int? fileSize,
    Location? location,
  }) =>
      Message(
        id: id ?? this.id,
        chatId: chatId ?? this.chatId,
        senderId: senderId ?? this.senderId,
        content: content ?? this.content,
        messageType: messageType ?? this.messageType,
        deletedBy: deletedBy ?? this.deletedBy,
        status: status ?? this.status,
        deliveredAt: deliveredAt ?? this.deliveredAt,
        seenAt: seenAt ?? this.seenAt,
        seenBy: seenBy ?? this.seenBy,
        reactions: reactions ?? this.reactions,
        sentAt: sentAt ?? this.sentAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        fileUrl: fileUrl ?? this.fileUrl,
        fileName: fileName ?? this.fileName,
        fileSize: fileSize ?? this.fileSize,
        location: location ?? this.location,
      );

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["_id"],
        chatId: json["chatId"],
        senderId: json["senderId"],
        content: json["content"],
        messageType: json["messageType"],
        deletedBy: List<dynamic>.from(json["deletedBy"].map((x) => x)),
        status: json["status"],
        deliveredAt: json["deliveredAt"],
        seenAt: json["seenAt"] == null ? null : DateTime.parse(json["seenAt"]),
        seenBy: List<String>.from(json["seenBy"].map((x) => x)),
        reactions: List<dynamic>.from(json["reactions"].map((x) => x)),
        sentAt: DateTime.parse(json["sentAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        fileUrl: json["fileUrl"],
        fileName: json["fileName"],
        fileSize: json["fileSize"],
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "chatId": chatId,
        "senderId": senderId,
        "content": content,
        "messageType": messageType,
        "deletedBy": List<dynamic>.from(deletedBy.map((x) => x)),
        "status": status,
        "deliveredAt": deliveredAt,
        "seenAt": seenAt?.toIso8601String(),
        "seenBy": List<dynamic>.from(seenBy.map((x) => x)),
        "reactions": List<dynamic>.from(reactions.map((x) => x)),
        "sentAt": sentAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "fileUrl": fileUrl,
        "fileName": fileName,
        "fileSize": fileSize,
        "location": location?.toJson(),
      };
}
