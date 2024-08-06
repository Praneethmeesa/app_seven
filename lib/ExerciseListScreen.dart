import 'package:flutter/material.dart';

class ExerciseListScreen extends StatelessWidget {
  final List<Map<String, String>> exercises = [
    {'name': 'Jumping jacks', 'time': '0:10', 'duration': '0:30'},
    {'name': 'Wall sit', 'time': '0:10', 'duration': '0:30'},
    {'name': 'Push-up', 'time': '0:10', 'duration': '0:30'},
    {'name': 'Abdominal crunch', 'time': '0:10', 'duration': '0:30'},
    {'name': 'Step-up onto chair', 'time': '0:10', 'duration': '0:30'},
    {'name': 'Squat', 'time': '0:10', 'duration': '0:30'},
    {'name': 'Triceps dip on chair', 'time': '0:10', 'duration': '0:30'},
    {'name': 'Plank', 'time': '0:10', 'duration': '0:30'},
    {'name': 'High knees running in place', 'time': '0:10', 'duration': '0:30'},
    {'name': 'Lunge', 'time': '0:10', 'duration': '0:30'},
    {'name': 'Push-up and rotation', 'time': '0:10', 'duration': '0:30'},
    {'name': 'Side plank', 'time': '0:10', 'duration': '0:30'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Scientific 7-Minute Workout'),
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
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(exercises[index]['time']!),
                Text(exercises[index]['name']!),
                Text(exercises[index]['duration']!),
              ],
            ),
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
