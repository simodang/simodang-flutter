import 'package:flutter/material.dart';
import 'package:simodang_flutter/data/models/metric.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MetricChartWidget extends StatelessWidget {
  const MetricChartWidget({
    super.key,
    required this.metrics,
    required this.metricType,
  });

  final List<Metric> metrics;
  final String metricType;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: const CategoryAxis(
        isVisible: false,
      ),
      tooltipBehavior: TooltipBehavior(
        enable: true,
      ),
      zoomPanBehavior: ZoomPanBehavior(
        enablePinching: true,
        enablePanning: true,
        zoomMode: ZoomMode.x,
      ),
      series: <LineSeries<Metric, String>>[
        LineSeries<Metric, String>(
          dataSource: metrics,
          xValueMapper: (Metric metric, _) {
            return metric.getFormattedTime();
          },
          yValueMapper: (Metric metric, _) {
            return metric.getMetric(metricType);
          },
        )
      ]
    );
  }
}
