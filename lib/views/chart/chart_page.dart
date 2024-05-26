import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_flutter/data/models/metric.dart';
import 'package:simodang_flutter/views/chart/chart_controller.dart';
import 'package:simodang_flutter/views/widgets/chart/metric_chart_widget.dart';
import 'package:simodang_flutter/views/widgets/chip/time_chip_widget.dart';
import 'package:simodang_flutter/views/widgets/list/metric_list_widget.dart';
import 'package:simodang_flutter/views/widgets/metric/last_metric_widget.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChartController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Grafik ${controller.getCasedProperty()}'),
            actions: [
              IconButton(
                icon: const Icon(Icons.calendar_month),
                onPressed: controller.pickDate,
              )],
          ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LastMetricWidget(
                      lastMetric: controller.isMetricsNotEmpty() ? controller.metrics.last : Metric.empty(),
                      metricType: controller.property ?? 'pH',
                      startDate: DateTime.now(),
                    ),
                    const SizedBox(height: 15),
                    MetricChartWidget(
                      metrics: controller.metrics,
                      metricType: controller.property ?? 'pH',
                      isAveraged: controller.isAveraged.value,
                    ),
                    TimeChipWidget(
                      currentIndex: controller.currentIndex.value,
                      onSelected: (int index) {
                        controller.changeIndex(index);
                      }
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Flexible(
                child: MetricListWidget(
                  metrics: controller.metrics.reversed.toList(),
                  property: controller.property ?? 'pH',
                ),
              ),
            ],
          )
        );
      },
    );
  }
}
