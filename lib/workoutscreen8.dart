import 'package:flutter/material.dart';

class WorkoutScreen8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Time!'),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              // Handle calendar icon press
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          WorkoutItem(
            title: 'The Scientific 7-Minute Workout',
            duration: '10:04',
            exercises: [],
          ),
          WorkoutItem(
            title: 'Core, Upper-Body, and Glutes',
            duration: '15:00',
            exercises: [
              Exercise(time: '0:05', name: 'Forearm Plank', duration: '3:00'),
              Exercise(time: '0:10', name: 'Side Plank (left)', duration: '1:30'),
              Exercise(time: '0:10', name: 'Side Plank (right)', duration: '1:30'),
              Exercise(time: '0:10', name: 'Forearm Plank', duration: '3:00'),
              Exercise(time: '0:20', name: 'Push-Ups', duration: '0:45'),
              Exercise(time: '0:20', name: 'Push-Ups', duration: '0:45'),
              Exercise(time: '0:15', name: 'Glute Bridge', duration: '3:00'),
            ],
          ),
        ],
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

class WorkoutItem extends StatelessWidget {
  final String title;
  final String duration;
  final List<Exercise> exercises;

  WorkoutItem({required this.title, required this.duration, required this.exercises});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(title),
        subtitle: Text(duration),
        leading: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            // Handle edit button press
          },
        ),
        children: exercises.map((exercise) => ListTile(
          title: Text(exercise.name),
          subtitle: Text(exercise.duration),
          leading: Text(exercise.time),
        )).toList(),
      ),
    );
  }
}

class Exercise {
  final String time;
  final String name;
  final String duration;

  Exercise({required this.time, required this.name, required this.duration});
}
