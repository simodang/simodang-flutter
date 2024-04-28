import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simodang_flutter/views/widgets/label/row_label_widget.dart';

class PondSeedWidget extends StatelessWidget {
  const PondSeedWidget({
    super.key,
    required this.seedDate,
    required this.seedCount,
  });

  final String seedDate;
  final int seedCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Informasi Bibit",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        RowLabelWidget(
          label: "Tanggal Tebar",
          value: DateFormat("dd MMMM yyyy").format(DateTime.parse(seedDate)),
        ),
        const SizedBox(height: 10),
        RowLabelWidget(
          label: "Jumlah Bibit",
          value: "$seedCount bibit",
        ),
      ],
    );
  }
}
