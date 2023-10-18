import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'question.dart';
class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _signInWithEmailAndPassword(BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      User? user = userCredential.user;
      if (user != null) {
        print('User signed in successfully: ${user.email}');
        // Navigate to the next screen after successful sign-in
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => QuestionnaireScreen(), // Assuming this is your next screen
        ));
      }
    } catch (e) {
      print('Error signing in: $e');
      // Handle errors (e.g., display error message to user).
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        backgroundColor: Colors.blue[900], // Dark Blue
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[900]!, Colors.blue[700]!, Colors.orange[100]!],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  _signInWithEmailAndPassword(context);
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange[300], // Light Orange
                  onPrimary: Colors.black, // Text color
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
