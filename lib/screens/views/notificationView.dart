import 'package:flutter/material.dart';

class Notificationview extends StatelessWidget {
  const Notificationview({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset(
            'assets/snooze.png',
            fit: BoxFit.contain,
            height: 200,
          ),
        ),
      ),
    );
  }
}
