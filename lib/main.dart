import 'package:chat_app__qurinom_solutions__assignment/core/api/api_service.dart';
import 'package:chat_app__qurinom_solutions__assignment/core/api/endpoints.dart';
import 'package:chat_app__qurinom_solutions__assignment/core/web_socket/web_socket_service.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/chat/bloc/chat_bloc.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/home/bloc/chat_list_bloc.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/login/bloc/login_bloc.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/login/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final ApiService apiService = ApiService();

  // ! Websocket endpoint is not provided
  // final WebSocketService wsService = WebSocketService();
  // wsService.connect(Endpoints.wsSendMessage);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc(api: apiService)),
        BlocProvider(create: (context) => ChatListBloc(api: apiService)),
        BlocProvider(
          create: (context) => ChatBloc(
            api: apiService,
            // socket: wsService,
          ),
        )
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App - Qurinom Solutions',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
