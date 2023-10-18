import 'package:flutter/material.dart';
import 'package:mental_health/RegistrationScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'sign_in_screen.dart';
import 'question.dart';
import 'landingscreen.dart';
import 'Task suggestion.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );


 runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mental Health Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // Set the initial route
      routes: {
        '/': (context) => LandingScreen(), // Landing screen
        '/signIn': (context) => SignInScreen(), // Sign-in screen
        '/register': (context) => RegistrationScreen(), // Registration screen
        '/questionnaire': (context) => QuestionnaireScreen(),
        '/taskSuggestions': (context) => TaskSuggestionsScreen(selectedExercise: '', selectedFeeling: '', selectedMood: '', selectedSleep: '',),
      },
    );
  }
}
