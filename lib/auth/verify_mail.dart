import 'package:batwara/services/services.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthService().user;
    final String email = user?.email ?? '<your email>';

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/auth.png'),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Verify your email',
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'An email has been sent to $email. Please verify your email to continue.',
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      AuthService().sendEmailVerification(user);
                    },
                    child: const Text('Resend Email'),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      AuthService().checkEmailVerification();
                    },
                    child: const Text('Reload verification status'),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      AuthService().user?.delete();
                    },
                    child: Text('Wrong Email $email? Try Again'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
