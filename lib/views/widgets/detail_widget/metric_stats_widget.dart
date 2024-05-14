import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_flutter/views/widgets/icon/metric_icon_widget.dart';

class MetricStatsWidget extends StatelessWidget {
  const MetricStatsWidget({
    super.key,
    required this.pondId,
  });

  final String pondId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Grafik Metrik Terbaru',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        MetricIconWidget(
          label: 'Suhu',
          value: '29 °C',
          icon: Icons.thermostat,
          softColor: Colors.blue[100]!,
          color: Colors.blue,
          onTap: () {
            Get.toNamed('/chart/$pondId?property=temperature');
          },
        ),
        const SizedBox(height: 16),
        MetricIconWidget(
          label: 'pH',
          value: '2 pH',
          icon: Icons.local_drink,
          softColor: Colors.orange[100]!,
          color: Colors.orange,
          onTap: () {
            Get.toNamed('/chart/$pondId?property=ph');
          },
        ),
        const SizedBox(height: 16),
        MetricIconWidget(
          label: 'TDO',
          value: '0.5 mg/L',
          icon: Icons.air,
          softColor: Colors.green[100]!,
          color: Colors.green,
          onTap: () {
            Get.toNamed('/chart/$pondId?property=tdo');
          },
        ),
        const SizedBox(height: 16),
        MetricIconWidget(
          label: 'TDS',
          value: '1000 ppm',
          icon: Icons.dew_point,
          softColor: Colors.brown[100]!,
          color: Colors.brown,
          onTap: () {
            Get.toNamed('/chart/$pondId?property=tds');
          },
        ),
        const SizedBox(height: 16),
        MetricIconWidget(
          label: 'Turbiditas',
          value: '100 NTU',
          icon: Icons.waves,
          softColor: Colors.teal[100]!,
          color: Colors.teal,
          onTap: () {
            Get.toNamed('/chart/$pondId?property=turbidity');
          },
        ),
      ],
    );
  }
}
