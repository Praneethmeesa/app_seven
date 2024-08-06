import 'package:flutter/material.dart';

class CompletedWorkoutsScreen extends StatelessWidget {
  final List<Map<String, String>> exampleWorkouts = [
    {
      'title': 'The Scientific 7-Minute Workout',
      'duration': '8:00',
    },
    {
      'title': 'Core, Upper-Body, and Glutes',
      'duration': '15:00',
    },
    {
      'title': 'Full Body Stretch',
      'duration': '12:00',
    },
    {
      'title': 'High-Intensity Interval Training',
      'duration': '20:00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Completed Workouts'),
      ),
      body: ListView.builder(
        itemCount: exampleWorkouts.length,
        itemBuilder: (context, index) {
          final workout = exampleWorkouts[index];
          return ListTile(
            title: Text(workout['title']!),
            subtitle: Text('Duration: ${workout['duration']}'),
            // Add any additional details if needed
          );
        },
      ),
    );
  }
}
