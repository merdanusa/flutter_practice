import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('Home')),
        body: Center(
          child: TextButton(onPressed: () {}, child: Text("Run")),
        ),
      ),
    );
  }
}
