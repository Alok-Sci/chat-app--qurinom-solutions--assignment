import 'package:chat_app__qurinom_solutions__assignment/chat_model.dart';
import 'package:chat_app__qurinom_solutions__assignment/core/extensions/build_context.extension.dart';
import 'package:chat_app__qurinom_solutions__assignment/login_screen.dart';
import 'package:chat_app__qurinom_solutions__assignment/widgets/chat_list_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Display "Add a new chat" dialog
    void _addNewChat() {
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ChatListTile(
                chat: ChatModel(
                  senderName: "Alok Singh",
                  senderEmail: "corporate.alok@gmail.com",
                ),
              ),
              ChatListTile(
                chat: ChatModel(
                  senderName: "Test Account",
                  senderEmail: "test.alok@gmail.com",
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewChat,
        tooltip: 'Add new chat',
        child: const Icon(Icons.person_add_alt_rounded),
      ),
    );
  }
}
