import 'package:flutter/material.dart';
import 'package:app_seven/ExerciseListScreen.dart';
import 'package:app_seven/workout_screen5.dart'; // Import WorkoutScreen5
import 'package:app_seven/WorkoutScreen6.dart';
import 'package:app_seven/WorkoutScreen2.dart';
import 'package:app_seven/workoutscreen7.dart';
import 'package:app_seven/workoutscreen8.dart';
import 'package:app_seven/workoutscreen4.dart';
// import 'package:app_seven/WorkoutTimerScreen.dart';
// import 'package:app_seven/settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Time!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/workoutList',
      routes: {
        '/workoutList': (context) => WorkoutListScreen(),
        '/exerciseList': (context) => ExerciseListScreen(),
        '/workoutScreen6': (context) => WorkoutScreen6(),
        '/workoutScreen7': (context) => WorkoutScreen7(),
        '/workoutScreen8': (context) => WorkoutScreen8(),
        '/workoutScreen5': (context) => WorkoutScreen5(), // Add route for WorkoutScreen5
        '/workoutTimer': (context) => WorkoutTimerScreen(),
        '/workoutScreen4': (context) => SettingsScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}

class WorkoutListScreen extends StatelessWidget {
  final List<Map<String, String>> workouts = [
    {
      'title': 'The Scientific 7-Minute Workout',
      'duration': '8:00',
    },
    {
      'title': 'Core, Upper-Body, and Glutes',
      'duration': '15:00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Time!'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.edit),
            title: Text(workouts[index]['title']!),
            trailing: Text(workouts[index]['duration']!),
            onTap: () {
              Navigator.pushNamed(context, '/workoutScreen5'); // Navigate to WorkoutScreen5
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/workoutScreen6');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
