import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class WorkoutTimerScreen extends StatelessWidget {
  final CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Scientific 7-Minute Workout'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('0:41'),
                Row(
                  children: List.generate(12, (index) {
                    return Icon(
                      index < 4 ? Icons.circle : Icons.timer,
                      size: 10,
                    );
                  }),
                ),
                Text('-7:19'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Get ready for:',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
            Text(
              'Wall sit',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CircularCountDownTimer(
              duration: 10, // duration in seconds
              initialDuration: 0,
              controller: _controller,
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
              ringColor: Colors.grey[300]!,
              ringGradient: null,
              fillColor: Colors.red,
              fillGradient: null,
              backgroundColor: Colors.white,
              backgroundGradient: null,
              strokeWidth: 10.0,
              strokeCap: StrokeCap.round,
              textStyle: TextStyle(
                fontSize: 33.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textFormat: CountdownTextFormat.S,
              isReverse: false,
              isReverseAnimation: false,
              isTimerTextShown: true,
              autoStart: true,
              onComplete: () {
                // Handle timer complete
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Time is up!'))
                );
              },
            ),
            SizedBox(height: 20),
            Text(
              'Next exercise: Push-up',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
