import 'package:app_seven/workout_screen5.dart';
import 'package:flutter/material.dart';
import 'package:app_seven/WorkoutScreen6.dart';
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
       //home: WorkoutScreen(),
     // home: WorkoutListScreen(),
      home: WorkoutScreen6(),
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
              // Handle notification button press
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Handle settings button press
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
              // Handle workout item tap
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle floating action button press
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
