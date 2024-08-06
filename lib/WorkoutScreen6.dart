import 'package:flutter/material.dart';

class WorkoutScreen6 extends StatefulWidget {
  const WorkoutScreen6({super.key});

  @override
  _WorkoutScreen6State createState() => _WorkoutScreen6State();
}

class _WorkoutScreen6State extends State<WorkoutScreen6> {
  String workoutName = 'Core, Upper-Body, and Glutes';
  int preludeTime = 10; // Prelude time in seconds
  List<Map<String, String>> workouts = [
    {'time': '0:05', 'exercise': 'Forearm Plank', 'duration': '3:00'},
    {'time': '0:10', 'exercise': 'Side Plank (left)', 'duration': '1:30'},
    {'time': '0:10', 'exercise': 'Side Plank (right)', 'duration': '1:30'},
    {'time': '0:10', 'exercise': 'Forearm Plank', 'duration': '3:00'},
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

  void _showPreludeDialog() {
    TextEditingController controller = TextEditingController(text: preludeTime.toString());
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Prelude Time'),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: 'Enter prelude time in seconds'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  int? newPreludeTime = int.tryParse(controller.text);
                  if (newPreludeTime != null) {
                    preludeTime = newPreludeTime;
                  }
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
      body: Stack(
        children: [
          ListView.builder(
            itemCount: workouts.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(workouts[index]['time']!),
                title: Text(workouts[index]['exercise']!),
                trailing: Text(workouts[index]['duration']!),
              );
            },
          ),
          Positioned(
            bottom: 50.0,
            left: MediaQuery.of(context).size.width * 0.5 - 100,
            child: GestureDetector(
              onTap: _showPreludeDialog,
              child: Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Prelude Time', style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 10),
                    Text('$preludeTime seconds', style: TextStyle(fontSize: 24)),
                  ],
                ),
              ),
            ),
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
