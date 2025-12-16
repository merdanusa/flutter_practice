import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

final GoRouter _router = GoRouter(
  routes: [GoRoute(path: "/", builder: (context, state) => const HomeScreen(8))],
);

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        brightness: Brightness.light,
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('Task manager')),
        body: WelcomeScreen(),
      ),
    );
  }
}
