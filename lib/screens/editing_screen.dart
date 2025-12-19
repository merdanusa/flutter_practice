import 'package:flutter/material.dart';

class NoteEditingScreen extends StatefulWidget {
  const NoteEditingScreen({super.key});

  @override
  State<NoteEditingScreen> createState() => _NoteEditingScreenState();
}

class _NoteEditingScreenState extends State<NoteEditingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      margin: EdgeInsets.all(20),
      child: Expanded(child: Column(
        children: [
          TextField(),
          TextField(),
        ],
      )),
    );
  }
}
