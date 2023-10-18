import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import 'question.dart'; // Assuming this is the screen you want to navigate to after sign-in
import 'RegistrationScreen.dart'; // Import your registration screen

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Column(
            children: [
              SignInScreen(
                providers: [
                  EmailAuthProvider(),
                ],
                headerBuilder: (context, constraints, shrinkOffset) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: AspectRatio(
                      aspectRatio: 1,
                    ),
                  );
                },
                subtitleBuilder: (context, action) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: action == AuthAction.signIn
                        ? const Text('Welcome to Our Mental Health Tracker, please sign in!')
                        : const Text('Welcome to Our Mental Health Tracker, please sign up!'),
                  );
                },
                footerBuilder: (context, action) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      'By signing in, you agree to our terms and conditions.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationScreen()),
                  );
                },
                child: Text('Register'),
              ),
            ],
          );
        }
        return QuestionnaireScreen(); // Navigate to the QuestionnaireScreen after sign-in
      },
    );
  }
}
