import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/hobbies_screen.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  final List<String> _routes = ['/home', '/home/hobbies'];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    GoRouter.of(context).go(_routes[index]); // navigate to route
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Router(
        routerDelegate: GoRouter.of(context).routerDelegate,
        backButtonDispatcher: GoRouter.of(context).backButtonDispatcher,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_handball),
            label: 'Hobbies',
          ),
        ],
      ),
    );
  }
}
