import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:simodang_flutter/data/models/metric.dart';

class LastMetricWidget extends StatelessWidget {
  const LastMetricWidget({
    super.key,
    required this.lastMetric,
    required this.metricType,
    required this.startDate,
    this.endDate,
  });

  final Metric lastMetric;
  final String metricType;
  final DateTime startDate;
  final DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              lastMetric.getMetric(metricType).toString(),
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              lastMetric.getUnit(metricType),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(
          formatDate(startDate, [dd, ' ', MM, ' ', yyyy]),
          style: const TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
