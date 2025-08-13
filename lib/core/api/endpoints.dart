class Endpoints {
  static const String baseUrl = "http://45.129.87.38:6065/";

  static const String login = "${baseUrl}user/login";
  static const String sendMessage = "${baseUrl}messages/sendMessage";
  static String getMessages(String chatId) =>
      "${baseUrl}messages/get-messagesformobile/$chatId";
  static String getChats(String userId) => "${baseUrl}chats/user-chats/$userId";


  // static String wsSendMessage = "";
}
