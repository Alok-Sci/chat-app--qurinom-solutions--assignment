import 'dart:io';
import 'package:dio/dio.dart';
import 'package:chat_app__qurinom_solutions__assignment/core/api/endpoints.dart';

class ApiService {
  final Dio dio;

  ApiService()
      : dio = Dio(
          BaseOptions(
            baseUrl: Endpoints.baseUrl,
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 30),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
              HttpHeaders.acceptHeader: "application/json",
            },
          ),
        );

  /// Login
  Future<Map<String, dynamic>> login(
    String email,
    String password,
    String role,
  ) async {
    try {
      final res = await dio.post(
        Endpoints.login,
        data: {
          "email": email,
          "password": password,
          "role": role,
        },
      );
      return res.data;
    } on DioException catch (e) {
      throw Exception("Login failed: ${_handleDioError(e)}");
    }
  }

  /// Get chats by userId
  Future<List<dynamic>> getUserChats(String userId) async {
    try {
      final res = await dio.get(Endpoints.getChats(userId));
      if (res.data is List) return res.data;
      throw Exception("Unexpected data format");
    } on DioException catch (e) {
      throw Exception("Failed to fetch chats: ${_handleDioError(e)}");
    }
  }

  /// Get chat messages by chatId
  Future<List<dynamic>> getChatMessages(String chatId) async {
    try {
      final res = await dio.get(Endpoints.getMessages(chatId));
      if (res.data is List) return res.data;
      throw Exception("Unexpected data format");
    } on DioException catch (e) {
      throw Exception("Failed to fetch messages: ${_handleDioError(e)}");
    }
  }

  /// Send message (supports text and files)
  Future<Map<String, dynamic>> sendMessage({
    required String chatId,
    required String senderId,
    String? content,
    required String messageType,
    File? file,
  }) async {
    try {
      // Send text message
      final res = await dio.post(
        Endpoints.sendMessage,
        data: {
          "chatId": chatId,
          "senderId": senderId,
          "content": content ?? "",
          "messageType": "text",
          "fileUrl": ""
        },
      );
      return res.data;
    } on DioException catch (e) {
      throw Exception("Failed to send message: ${_handleDioError(e)}");
    }
  }

  /// Helper to extract readable error messages
  String _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return "Connection timed out";
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return "Receive timeout in connection";
    } else if (e.type == DioExceptionType.badResponse) {
      return "Server error: ${e.response?.statusCode} ${e.response?.statusMessage}";
    } else if (e.type == DioExceptionType.connectionError) {
      return "Connection error: ${e.message}";
    }
    return e.message ?? "Unexpected error";
  }
}
