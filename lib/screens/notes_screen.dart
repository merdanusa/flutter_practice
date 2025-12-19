import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_application_1/data/notes.dart';
import 'package:flutter_application_1/models/note.dart';
import 'package:flutter_application_1/screens/editing_screen.dart';
import 'package:flutter_application_1/widgets/block.dart';

final random = Random();

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  bool isEditing = false;

  List<Color> colors = [
    Colors.orangeAccent,
    Colors.blueAccent,
    Colors.purpleAccent,
    Colors.pinkAccent,
    Colors.tealAccent,
    Colors.indigoAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87,
        leading: isEditing
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isEditing = false;
                  });
                },
                icon: const Icon(Icons.close),
              )
            : null,
      ),
      floatingActionButton: isEditing
          ? null
          : FloatingActionButton(
              backgroundColor: Colors.deepPurple,
              onPressed: () {
                setState(() {
                  isEditing = true;
                });
              },
              child: const Icon(Icons.add, color: Colors.white),
            ),
      body: isEditing
          ? NoteEditingScreen(
              onSave: (title, content) {
                setState(() {
                  notes.add(Note(title: title, content: content));
                  isEditing = false;
                });
              },
              onCancel: () {
                setState(() {
                  isEditing = false;
                });
              },
            )
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: notes.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.note_add,
                            size: 80,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No notes yet',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Tap the + button to create one',
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                        ],
                      ),
                    )
                  : GridView.builder(
                      itemCount: notes.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 0.92,
                          ),
                      itemBuilder: (context, index) {
                        final block = notes[index];
                        return Block(
                          title: block.title,
                          content: block.content,
                          color: colors[index % colors.length],
                          // onTap: () {
                          //   // Optional: navigate to detail/edit existing note
                          // },
                        );
                      },
                    ),
            ),
    );
  }
}
