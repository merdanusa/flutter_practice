import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/chat.dart';
import 'package:flutter_application_1/widgets/chat.dart';
import 'package:flutter_application_1/widgets/input.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final List<ChatMessage> messages = [];

  void _handleSendMessage(String text) {
    setState(() {
      messages.add(ChatMessage(text: text, isMe: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: Column(
        children: [
          Expanded(child: ChatWidget(messages: messages)),
          ChatInputWidget(onSend: _handleSendMessage),
        ],
      ),
    );
  }
}
