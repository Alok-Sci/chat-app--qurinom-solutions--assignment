import 'dart:developer';

import 'package:chat_app__qurinom_solutions__assignment/features/home/models/chat_model.dart';
import 'package:chat_app__qurinom_solutions__assignment/core/utils/extensions/build_context.extension.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/home/bloc/chat_list_bloc.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/home/bloc/chat_list_events.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/home/bloc/chat_list_states.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/login/views/login_screen.dart';
import 'package:chat_app__qurinom_solutions__assignment/core/widgets/chat_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.userId});

  final String userId;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    log("Logged in UserID: ${widget.userId}");

    // fetch chats for the user
    context.read<ChatListBloc>().add(FetchChatList(widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    // Display "Add a new chat" dialog
    void addNewChat() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Coming Soon",
              style: context.textTheme.titleLarge,
            ),
            content: Text(
              "Adding a new chat is not yet supported",
              style: context.textTheme.bodyMedium,
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Okay"),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.primary,
        foregroundColor: context.colorScheme.onPrimary,
        title: Text(
          "C H A T S",
          style: context.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colorScheme.onPrimary,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout_rounded),
            onPressed: () {
              // TODO: Log out of the app.
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          )
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<ChatListBloc, ChatListState>(
          builder: (context, state) {

            // Chat list laoding state
            if (state is ChatListLoading) {
              return const Center(child: CircularProgressIndicator());
            } 
            
            // chat list loaded state
            else if (state is ChatListLoaded) {
              final chats = state.chats;
              if (chats.isEmpty) {
                return const Center(child: Text("No chats yet."));
              }
              return ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final Chat chat = chats[index];
                  return ChatListTile(chat: chat,);
                },
              );
            } 
            
            // chat list error state
            else if (state is ChatListError) {
              final error = state.error;
              return Center(child: Text("Error: $error"));
            }
            return SizedBox();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewChat,
        tooltip: 'Add new chat',
        child: const Icon(Icons.person_add_alt_rounded),
      ),
    );
  }
}
