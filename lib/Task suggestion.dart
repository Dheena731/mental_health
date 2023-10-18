import 'package:flutter/material.dart';

class TaskSuggestionsScreen extends StatelessWidget {
  final String selectedFeeling;
  final String selectedMood;
  final String selectedSleep;
  final String selectedExercise;

  TaskSuggestionsScreen({
    required this.selectedFeeling,
    required this.selectedMood,
    required this.selectedSleep,
    required this.selectedExercise,
  });

  List<String> generateTaskSuggestions() {
  List<String> tasks = [];

  if (selectedFeeling == 'Yes' && selectedMood == '1') {
    tasks.add('Take a few minutes to practice deep breathing exercises.');
  }

  if (selectedFeeling == 'No' && selectedMood == '5') {
    tasks.add('Go for a walk and enjoy some fresh air.');
  }

  if (selectedSleep == '10') {
    tasks.add('Congrats on great sleep! Consider a morning workout.');
  }

  if (selectedExercise == 'Yes') {
    tasks.add('Plan a workout session today for your physical well-being.');
  }

  if (selectedFeeling == 'Yes' && selectedMood == '10') {
    tasks.add('Engage in a creative activity to boost your mood.');
  }

  if (selectedFeeling == 'No' && selectedMood == '1') {
    tasks.add('Try meditation to calm your mind and improve your mood.');
  }

  if (selectedSleep == '1') {
    tasks.add('Focus on creating a bedtime routine for better sleep.');
  }

  if (selectedExercise == 'No') {
    tasks.add('Consider taking a short walk or doing some light stretches.');
  }

  tasks.add('Create a list of things you are grateful for today.');

  tasks.add('Read a book or listen to an audiobook for at least 30 minutes.');

  tasks.add('Prepare a healthy and balanced meal for yourself.');

  tasks.add('Set aside some time for a hobby or activity you enjoy.');

  tasks.add('Write down your thoughts and feelings in a journal.');

  tasks.add('Reach out to a friend or family member for a chat.');

  tasks.add('Take a break and practice mindfulness for a few minutes.');

  tasks.add('Declutter and organize a small area of your living space.');

  tasks.add('Listen to calming music or nature sounds for relaxation.');

  tasks.add('Try a new form of exercise or physical activity.');

  tasks.add('Plan and schedule your tasks and goals for the week.');

  tasks.add('Watch a motivational or inspirational video online.');

  tasks.add('Reflect on your achievements and set new goals for yourself.');

  tasks.add('Explore a new skill or hobby through online tutorials.');

  return tasks;
}


  
  @override
  Widget build(BuildContext context) {
    List<String> taskSuggestions = generateTaskSuggestions();

    return Scaffold(
      appBar: AppBar(
        title: Text('Task Suggestions'),
        backgroundColor: Colors.blue[900], // Set the app bar color
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[900]!, Colors.orange[300]!],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Based on your responses:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set text color
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Feeling: $selectedFeeling',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Text(
                'Mood: $selectedMood',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Text(
                'Sleep Quality: $selectedSleep',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Text(
                'Exercise: $selectedExercise',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'Here are some suggestions for you:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: taskSuggestions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      title: Text(
                        taskSuggestions[index],
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}