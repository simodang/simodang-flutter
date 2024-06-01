import 'package:flutter/material.dart';

class PondStatusStep extends StatelessWidget {
  const PondStatusStep({
    super.key,
    required this.setStatus,
    required this.status,
  });

  final Function(bool) setStatus;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Wrap(
            spacing: 10,
            children: ['Terisi', 'Kosong'].map((e) {
              return ChoiceChip(
                label: Text(e),
                selected: status == (e == 'Terisi'),
                onSelected: (bool selected) {
                  setStatus(e == 'Terisi');
                },
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
