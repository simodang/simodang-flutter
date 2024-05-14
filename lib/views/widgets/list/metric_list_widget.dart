import 'package:flutter/material.dart';
import 'package:simodang_flutter/data/models/metric.dart';

class MetricListWidget extends StatelessWidget {
  MetricListWidget({
    super.key,
    required this.metrics,
    required this.property,
  });

  final List<Metric> metrics;
  final String property;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: metrics.length,
      itemBuilder: (context, index) {
        final metric = metrics[index];
        return ListTile(
          title: Text(
            metric.getMetric(property).toString(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(metric.getFormattedDateTime()),
        );
      },
    );
  }
}
