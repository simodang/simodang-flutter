import 'package:flutter/material.dart';
import 'package:simodang_flutter/views/widgets/pill/pill_label_widget.dart';

class PondConditionWidget extends StatelessWidget {
  const PondConditionWidget({
    super.key,
    required this.isFilled,
    required this.status,
  });

  final bool isFilled;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Kondisi Kolam",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        PillLabelWidget(
          label: "Kolam Terisi",
          value: isFilled ? "Ya" : "Tidak",
          isTrue: isFilled,
        ),
        PillLabelWidget(
          label: "Status",
          value: isFilled ? "Baik" : "Buruk",
          isTrue: isFilled,
        ),
      ],
    );
  }
}
