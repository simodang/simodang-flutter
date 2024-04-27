import 'package:flutter/material.dart';

class TitleButtonWidget extends StatelessWidget {
  const TitleButtonWidget({
    super.key,
    required this.title,
    required this.buttonText,
  });
  
  final String title;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {

          },
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          )
        )
      ],
    );
  }
}
