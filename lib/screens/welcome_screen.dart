import 'package:flutter/material.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Text(
                "Welcome to task manager app!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 36),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 400,
                child: Image.asset(
                  'assets/images/welcome_image.png',
                  fit: BoxFit.cover,
                ),
              ),

              const Spacer(),

              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text('Move to app'),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
