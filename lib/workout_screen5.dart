import 'package:flutter/material.dart';

class WorkoutScreen5 extends StatefulWidget {
  @override
  _WorkoutScreen5State createState() => _WorkoutScreen5State();
}

class _WorkoutScreen5State extends State<WorkoutScreen5> {
  String workoutName = 'Core, Upper-Body, and Glutes';
  List<Map<String, String>> workouts = [
    {'time': '0:05', 'exercise': 'Forearm Plank', 'duration': '3:00'},
    {'time': '0:15', 'exercise': 'Side Plank (left)', 'duration': '1:30'},
    {'time': '0:20', 'exercise': 'Side Plank (right)', 'duration': '1:30'},
    {'time': '0:31', 'exercise': 'Forearm Plank', 'duration': '3:00'},
  ];

  void _showRenameDialog() {
    TextEditingController controller = TextEditingController(text: workoutName);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Workout Name'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Enter workout name'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Rename'),
              onPressed: () {
                setState(() {
                  workoutName = controller.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(workoutName),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: _showRenameDialog,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(workouts[index]['time']!),
            title: Text(workouts[index]['exercise']!),
            trailing: Text(workouts[index]['duration']!),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
