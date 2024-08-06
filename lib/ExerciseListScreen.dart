import 'package:flutter/material.dart';

class ExerciseListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise List'),
      ),
      body: ListView(
        children: [
          ExerciseListItem(
            title: 'Push-Up',
            duration: '1:00',
            description: 'A basic exercise to strengthen upper body.',
          ),
          ExerciseListItem(
            title: 'Squat',
            duration: '1:30',
            description: 'An exercise for lower body strength.',
          ),
          ExerciseListItem(
            title: 'Burpee',
            duration: '2:00',
            description: 'A full-body exercise with a cardio component.',
          ),
        ],
      ),
    );
  }
}

class ExerciseListItem extends StatelessWidget {
  final String title;
  final String duration;
  final String description;

  ExerciseListItem({
    required this.title,
    required this.duration,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text('$duration - $description'),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Handle item tap
        },
      ),
    );
  }
}
