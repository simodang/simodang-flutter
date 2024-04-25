import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({
    super.key,
    required this.hourParam,
    required this.name,
  });

  final int hourParam;
  final String name;

  String greetingByTime(int hour) {
    if (hour >= 5 && hour < 12) {
      return 'Good Morning👋';
    } else if (hour >= 12 && hour < 15) {
      return 'Good Afternoon👋';
    } else if (hour >= 15 && hour < 18) {
      return 'Good Evening👋';
    } else {
      return 'Good Night👋';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(greetingByTime(hourParam)),
            Text(
              name,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        const Spacer(),
        const IconButton(
          icon: Icon(Icons.notifications),
          onPressed: null,
        )
      ],
    );
  }
}
