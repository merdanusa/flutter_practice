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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: notes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final block = notes[index];
            return Block(
              title: block.title,
              content: block.content,
              color: colors[index % colors.length],
            );
          },
        ),
      ),
    );
  }
}
