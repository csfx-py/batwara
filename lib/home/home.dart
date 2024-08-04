import 'package:batwara/auth/auth.dart';
import 'package:batwara/crews/crews.dart';
import 'package:batwara/services/auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text('Error');
        } else if (snapshot.hasData) {
          return const CrewsScreen();
        } else {
          return const AuthScreen();
        }
      },
    );
  }
}
