import 'package:flutter/material.dart';

class NoteEditingScreen extends StatefulWidget {
  final String title;
  final String content;
  final Function(String title, String content) onSave;
  final VoidCallback onCancel;

  const NoteEditingScreen({
    super.key,
    required this.title,
    required this.content,
    required this.onSave,
    required this.onCancel,
  });

  @override
  State<NoteEditingScreen> createState() => _NoteEditingScreenState();
}

class _NoteEditingScreenState extends State<NoteEditingScreen> {
  late final _titleController = TextEditingController(text: widget.title);
  late final _contentController = TextEditingController(text: widget.content);
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.title.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _saveNote() {
    final title = _titleController.text.trim();
    final content = _contentController.text.trim();

    if (title.isEmpty && content.isEmpty) {
      widget.onCancel();
      return;
    }

    widget.onSave(
      title.isEmpty ? 'Untitled' : title,
      content.isEmpty ? 'No content' : content,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            focusNode: _focusNode,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            decoration: const InputDecoration(
              hintText: 'Title',
              border: InputBorder.none,
              hintStyle: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: TextField(
              controller: _contentController,
              maxLines: null,
              expands: true,
              style: const TextStyle(fontSize: 18),
              decoration: const InputDecoration(
                hintText: 'Start typing...',
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: widget.onCancel,
                child: const Text(
                  'Cancel',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: _saveNote,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Save', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
