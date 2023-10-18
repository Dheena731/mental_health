import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Task suggestion.dart';

class QuestionnaireScreen extends StatefulWidget {
  @override
  _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  String selectedFeeling = '';
  String selectedMood = '';
  String selectedSleep = '';
  String selectedExercise = '';

  void _saveResponseToFirebase() {
    FirebaseFirestore.instance.collection('user_responses').add({
      'question1': 'Have you been feeling stressed or anxious lately?',
      'response1': selectedFeeling,
      'question2': 'How would you rate your mood today (1-10)?',
      'response2': selectedMood,
      'question3': 'How well have you been sleeping? (1-10)',
      'response3': selectedSleep,
      'question4': 'Have you been getting regular exercise? (Yes/No)',
      'response4': selectedExercise,
      'timestamp': Timestamp.now(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questionnaire'),
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
            children: <Widget>[
              ListTile(
                title: Text(
                  'Have you been feeling stressed or anxious lately?',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              DropdownButton<String>(
                value: selectedFeeling,
                onChanged: (String? value) {
                  setState(() {
                    selectedFeeling = value!;
                  });
                },
                items: <String>['', 'Yes', 'No']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                dropdownColor: Colors.white,
              ),
              Divider(color: Colors.white), // Adds a visual separator between questions

              ListTile(
                title: Text(
                  'How would you rate your mood today (1-10)?',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              DropdownButton<String>(
                value: selectedMood,
                onChanged: (String? value) {
                  setState(() {
                    selectedMood = value!;
                  });
                },
                items: <String>['', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                dropdownColor: Colors.white,
              ),
              Divider(color: Colors.white), // Adds a visual separator between questions

              ListTile(
                title: Text(
                  'How well have you been sleeping? (1-10)',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              DropdownButton<String>(
                value: selectedSleep,
                onChanged: (String? value) {
                  setState(() {
                    selectedSleep = value!;
                  });
                },
                items: <String>['', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                dropdownColor: Colors.white,
              ),
              Divider(color: Colors.white), // Adds a visual separator between questions

              ListTile(
                title: Text(
                  'Have you been getting regular exercise? (Yes/No)',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              DropdownButton<String>(
                value: selectedExercise,
                onChanged: (String? value) {
                  setState(() {
                    selectedExercise = value!;
                  });
                },
                items: <String>['', 'Yes', 'No']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                dropdownColor: Colors.white,
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  _saveResponseToFirebase();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskSuggestionsScreen(
                        selectedFeeling: selectedFeeling,
                        selectedMood: selectedMood,
                        selectedSleep: selectedSleep,
                        selectedExercise: selectedExercise,
                      ),
                    ),
                  );
                },
                child: Text(
                  'Submit',
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
