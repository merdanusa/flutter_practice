import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/hobbies.dart';
import 'package:flutter_application_1/models/hobby.dart';
import 'package:flutter_application_1/widgets/input.dart';
import 'package:flutter_application_1/widgets/button.dart';

class HobbiesScreen extends StatefulWidget {
  const HobbiesScreen({super.key});

  @override
  State<HobbiesScreen> createState() => _HobbiesScreen();
}

class _HobbiesScreen extends State<HobbiesScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Hobby> _hobbies = [];

  @override
  void initState() {
    super.initState();
    _hobbies = List.from(hobbies);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addHobby() {
    final taskText = _controller.text.trim();
    if (taskText.isNotEmpty) {
      final newHobby = Hobby(id: _hobbies.length + 1, title: taskText);
      setState(() {
        _hobbies.add(newHobby);
        hobbies.add(newHobby);
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Hobbies'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Input(
              controller: _controller,
              label: 'New Hobby',
              placeholder: 'What needs to be added?',
            ),
            const SizedBox(height: 16),
            Button(onPressed: _addHobby, label: 'Add Hobby', primary: true),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _hobbies.length,
                itemBuilder: (context, index) {
                  final task = _hobbies[index];
                  return ListTile(title: Text(task.title));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
