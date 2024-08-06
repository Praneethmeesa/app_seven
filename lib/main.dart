import 'package:flutter/material.dart';
import 'workout_timer_screen.dart';
import 'settings_screen.dart';
import 'completed_workouts_screen.dart';

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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> completedWorkouts = [];

  void _addCompletedWorkout(String workout) {
    setState(() {
      completedWorkouts.add(workout);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Time!'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.note),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WorkoutTimerScreen(),
                ),
              ).then((result) {
                if (result != null) {
                  _addCompletedWorkout(result);
                }
              });
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          WorkoutItem(
            title: 'The Scientific 7-Minute Workout',
            duration: '8:00',
          ),
          WorkoutItem(
            title: 'Core, Upper-Body, and Glutes',
            duration: '15:00',
          ),
        ],
      ),
    );
  }
}

class WorkoutItem extends StatelessWidget {
  final String title;
  final String duration;

  WorkoutItem({required this.title, required this.duration});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(duration),
    );
  }
}
