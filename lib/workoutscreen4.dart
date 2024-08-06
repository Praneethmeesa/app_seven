import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _threeSecondsLeftSound = 'Beep';
  String _endOfExerciseSound = 'Ding';
  String _endOfTrainingSound = 'Applause';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Time! Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sounds', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            _buildDropdown(
              '3 seconds left',
              _threeSecondsLeftSound,
                  (String? newValue) {
                setState(() {
                  _threeSecondsLeftSound = newValue!;
                });
              },
            ),
            _buildDropdown(
              'End of exercise',
              _endOfExerciseSound,
                  (String? newValue) {
                setState(() {
                  _endOfExerciseSound = newValue!;
                });
              },
            ),
            _buildDropdown(
              'End of training',
              _endOfTrainingSound,
                  (String? newValue) {
                setState(() {
                  _endOfTrainingSound = newValue!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, String value, ValueChanged<String?> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        DropdownButton<String>(
          value: value,
          onChanged: onChanged,
          items: <String>['Beep', 'Ding', 'Applause'].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
