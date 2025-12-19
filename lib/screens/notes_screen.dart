import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_application_1/data/notes.dart';
import 'package:flutter_application_1/widgets/block.dart';

final random = Random();

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<Color> colors = [
    Colors.orangeAccent,
    Colors.blueAccent,
    Colors.purpleAccent,
    Colors.pinkAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final note = notes[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Block(
                title: note.title,
                content: note.content,
                color: colors[index % colors.length],
              ),
            );
          },
        ),
      ),
    );
  }
}
