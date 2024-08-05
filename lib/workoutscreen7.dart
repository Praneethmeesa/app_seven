import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WorkoutScreen7(),
    );
  }
}

class WorkoutScreen7 extends StatefulWidget {
  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen7> {
  int _start = 3; // Start time in seconds
  Timer? _timer;
  final int _totalDuration = 15; // Total duration for the progress indicator

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Core, Upper-Body, and Glutes'),
        actions: [
          IconButton(
            icon: Icon(Icons.spa), // Replace with your own icon
            onPressed: () {
              // Add functionality for the icon
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LinearProgressIndicator(
              value: 1 - (_start / _totalDuration),
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('$_start', style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('-${(_totalDuration - _start).toString().padLeft(2, '0')}', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Get ready for:',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 35,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Forearm Plank',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 100,
                    height: 100,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(
                          value: _start / 3,
                          strokeWidth: 10,
                          backgroundColor: Colors.grey[300],
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                        ),
                        Text(
                          '$_start',
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Next exercise: Side Plank (left)',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
