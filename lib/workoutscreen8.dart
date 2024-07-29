import 'package:flutter/material.dart';

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
      home: WorkoutScreen8(),
    );
  }
}

class WorkoutScreen8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Time!'),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {},
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
              ExerciseItem(time: '0:05', name: 'Forearm Plank', duration: '3:00'),
              ExerciseItem(time: '0:10', name: 'Side Plank (left)', duration: '1:30'),
              ExerciseItem(time: '0:10', name: 'Side Plank (right)', duration: '1:30'),
              ExerciseItem(time: '0:10', name: 'Forearm Plank', duration: '3:00'),
              ExerciseItem(time: '0:20', name: 'Push-Ups', duration: '0:45'),
              ExerciseItem(time: '0:20', name: 'Push-Ups', duration: '0:45'),
              ExerciseItem(time: '0:15', name: 'Glute Bridge', duration: '3:00'),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class WorkoutItem extends StatelessWidget {
  final String title;
  final String duration;
  final List<ExerciseItem> exercises;

  WorkoutItem({required this.title, required this.duration, required this.exercises});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(title),
        subtitle: Text(duration),
        leading: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {},
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

class ExerciseItem {
  final String time;
  final String name;
  final String duration;

  ExerciseItem({required this.time, required this.name, required this.duration});
}
