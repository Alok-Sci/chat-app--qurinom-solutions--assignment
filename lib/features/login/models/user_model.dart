// To parse this JSON data, do
//
//     final user = userfromJson(jsonString);

import 'dart:convert';

User userfromJson(String str) => User.fromJson(json.decode(str));

String usertoJson(User data) => json.encode(data.toJson());

class User {
  final Location location;
  final String id;
  final String name;
  final String email;
  final String gender;
  final String? phone;
  final String? addressLane1;
  final String? addressLane2;
  final String? city;
  final String state;
  final String? postalCode;
  final String? country;
  final bool isOnline;
  final List<User>? blockedUsers;
  final String role;
  final bool isVerified;
  final bool isDeleted;
  final String? deletedMessage;
  final bool isDisabled;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int? v;
  final DateTime? lastSeen;
  final String? profile;
  final DateTime? deletedTime;
  final String? plan;
  final String? previousPlan;
  final DateTime? createdForTtl;
  final List<PaymentHistory>? paymentHistory;
  final String? referralCode;
  final DateTime? planEndDate;
  final List<String> fcmTokens;

  User({
    required this.location,
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    this.phone,
    this.addressLane1,
    this.addressLane2,
    this.city,
    required this.state,
    this.postalCode,
    required this.country,
    required this.isOnline,
    this.blockedUsers,
    required this.role,
    required this.isVerified,
    required this.isDeleted,
    this.deletedMessage,
    required this.isDisabled,
    required this.createdAt,
    this.updatedAt,
    this.v,
    this.lastSeen,
    this.profile,
    this.deletedTime,
    this.plan,
    this.previousPlan,
    this.createdForTtl,
    this.paymentHistory,
    this.referralCode,
    this.planEndDate,
    required this.fcmTokens,
  });

  User copyWith({
    Location? location,
    String? id,
    String? name,
    String? email,
    String? gender,
    String? phone,
    String? addressLane1,
    String? addressLane2,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    bool? isOnline,
    List<User>? blockedUsers,
    String? role,
    bool? isVerified,
    bool? isDeleted,
    String? deletedMessage,
    bool? isDisabled,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    DateTime? lastSeen,
    String? profile,
    DateTime? deletedTime,
    String? plan,
    String? previousPlan,
    DateTime? createdForTtl,
    List<PaymentHistory>? paymentHistory,
    String? referralCode,
    DateTime? planEndDate,
    List<String>? fcmTokens,
  }) =>
      User(
        location: location ?? this.location,
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        phone: phone ?? this.phone,
        addressLane1: addressLane1 ?? this.addressLane1,
        addressLane2: addressLane2 ?? this.addressLane2,
        city: city ?? this.city,
        state: state ?? this.state,
        postalCode: postalCode ?? this.postalCode,
        country: country ?? this.country,
        isOnline: isOnline ?? this.isOnline,
        blockedUsers: blockedUsers ?? this.blockedUsers,
        role: role ?? this.role,
        isVerified: isVerified ?? this.isVerified,
        isDeleted: isDeleted ?? this.isDeleted,
        deletedMessage: deletedMessage ?? this.deletedMessage,
        isDisabled: isDisabled ?? this.isDisabled,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        lastSeen: lastSeen ?? this.lastSeen,
        profile: profile ?? this.profile,
        deletedTime: deletedTime ?? this.deletedTime,
        plan: plan ?? this.plan,
        previousPlan: previousPlan ?? this.previousPlan,
        createdForTtl: createdForTtl ?? this.createdForTtl,
        paymentHistory: paymentHistory ?? this.paymentHistory,
        referralCode: referralCode ?? this.referralCode,
        planEndDate: planEndDate ?? this.planEndDate,
        fcmTokens: fcmTokens ?? this.fcmTokens,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        location: Location.fromJson(json["location"]),
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        phone: json["phone"],
        addressLane1: json["addressLane1"],
        addressLane2: json["addressLane2"],
        city: json["city"],
        state: json["state"],
        postalCode: json["postalCode"],
        country: json["country"],
        isOnline: json["isOnline"],
        blockedUsers: List<User>.from(json["blockedUsers"].map((x) => x)),
        role: json["role"],
        isVerified: json["isVerified"],
        isDeleted: json["isDeleted"],
        deletedMessage: json["deletedMessage"],
        isDisabled: json["isDisabled"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : null,
        v: json["__v"],
        lastSeen:
            json["lastSeen"] != null ? DateTime.parse(json["lastSeen"]) : null,
        profile: json["profile"],
        deletedTime: json["deletedTime"] != null
            ? DateTime.parse(json["deletedTime"])
            : null,
        plan: json["plan"],
        previousPlan: json["previousPlan"],
        createdForTtl: json["createdForTTL"] != null
            ? DateTime.parse(json["createdForTTL"])
            : null,
        paymentHistory: List<PaymentHistory>.from(
            json["paymentHistory"].map((x) => PaymentHistory.fromJson(x))),
        referralCode: json["referralCode"],
        planEndDate: json["planEndDate"] != null
            ? DateTime.parse(json["planEndDate"])
            : null,
        fcmTokens: List<String>.from(json["fcmTokens"]?.map((x) => x) ?? []),
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "_id": id,
        "name": name,
        "email": email,
        "gender": gender,
        "phone": phone,
        "addressLane1": addressLane1,
        "addressLane2": addressLane2,
        "city": city,
        "state": state,
        "postalCode": postalCode,
        "country": country,
        "isOnline": isOnline,
        "blockedUsers": List<dynamic>.from(blockedUsers?.map((x) => x) ?? []),
        "role": role,
        "isVerified": isVerified,
        "isDeleted": isDeleted,
        "deletedMessage": deletedMessage,
        "isDisabled": isDisabled,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "lastSeen": lastSeen?.toIso8601String(),
        "profile": profile,
        "deletedTime": deletedTime?.toIso8601String(),
        "plan": plan,
        "previousPlan": previousPlan,
        "createdForTTL": createdForTtl?.toIso8601String(),
        "paymentHistory":
            List<dynamic>.from(paymentHistory?.map((x) => x.toJson()) ?? []),
        "referralCode": referralCode,
        "planEndDate": planEndDate?.toIso8601String(),
        "fcmTokens": List<dynamic>.from(fcmTokens.map((x) => x)),
      };
}

class Location {
  final double latitude;
  final double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  Location copyWith({
    double? latitude,
    double? longitude,
  }) =>
      Location(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class PaymentHistory {
  final String orderId;
  final int amount;
  final String currency;
  final String status;
  final Method method;
  final DateTime paidAt;
  final String id;

  PaymentHistory({
    required this.orderId,
    required this.amount,
    required this.currency,
    required this.status,
    required this.method,
    required this.paidAt,
    required this.id,
  });

  PaymentHistory copyWith({
    String? orderId,
    int? amount,
    String? currency,
    String? status,
    Method? method,
    DateTime? paidAt,
    String? id,
  }) =>
      PaymentHistory(
        orderId: orderId ?? this.orderId,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        status: status ?? this.status,
        method: method ?? this.method,
        paidAt: paidAt ?? this.paidAt,
        id: id ?? this.id,
      );

  factory PaymentHistory.fromJson(Map<String, dynamic> json) => PaymentHistory(
        orderId: json["orderId"],
        amount: json["amount"],
        currency: json["currency"],
        status: json["status"],
        method: Method.fromJson(json["method"]),
        paidAt: DateTime.parse(json["paidAt"]),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "amount": amount,
        "currency": currency,
        "status": status,
        "method": method.toJson(),
        "paidAt": paidAt.toIso8601String(),
        "_id": id,
      };
}

class Method {
  final Upi? upi;

  Method({
    this.upi,
  });

  Method copyWith({
    Upi? upi,
  }) =>
      Method(
        upi: upi ?? this.upi,
      );

  factory Method.fromJson(Map<String, dynamic> json) => Method(
        upi: json["upi"] != null ? Upi.fromJson(json["upi"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "upi": upi?.toJson(),
      };
}

class Upi {
  final String? channel;
  final String? upiId;

  Upi({
    this.channel,
    this.upiId,
  });

  Upi copyWith({
    String? channel,
    String? upiId,
  }) =>
      Upi(
        channel: channel ?? this.channel,
        upiId: upiId ?? this.upiId,
      );

  factory Upi.fromJson(Map<String, dynamic> json) => Upi(
        channel: json["channel"],
        upiId: json["upi_id"],
      );

  Map<String, dynamic> toJson() => {
        "channel": channel,
        "upi_id": upiId,
      };
}
