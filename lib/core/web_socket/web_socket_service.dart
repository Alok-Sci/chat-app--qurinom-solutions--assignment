import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  WebSocketChannel? channel;

  void connect(String url) {
    channel = WebSocketChannel.connect(Uri.parse(url));
  }

  void sendMessage(String message) {
    channel?.sink.add(message);
  }

  Stream get stream => channel!.stream;

  void close() => channel?.sink.close();
}
