import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/task.dart';
import 'package:flutter_application_1/data/tasks.dart';
import 'package:flutter_application_1/widgets/input.dart';
import 'package:flutter_application_1/widgets/button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    _tasks = List.from(tasks);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addTask() {
    final taskText = _controller.text.trim();
    if (taskText.isNotEmpty) {
      final newTask = Task(
        id: _tasks.length + 1,
        title: taskText,
        isCompleted: false,
      );
      setState(() {
        _tasks.add(newTask);
        tasks.add(newTask);
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
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
              label: 'New Task',
              placeholder: 'What needs to be done?',
            ),
            const SizedBox(height: 16),
            Button(onPressed: _addTask, label: 'Add Task', primary: false),
            const SizedBox(height: 20),
            Expanded(
              child: _tasks.isEmpty
                  ? Center(child: Text("No any hobbies try to add them!"))
                  : ListView.builder(
                      itemCount: _tasks.length,
                      itemBuilder: (context, index) {
                        final task = _tasks[index];
                        return ListTile(
                          title: Text(task.title),
                          leading: Checkbox(
                            value: task.isCompleted,
                            onChanged: (value) {
                              setState(() {
                                task.isCompleted = value!;
                              });
                            },
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                _tasks.removeAt(index);
                              });
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
