import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_flutter/views/monitor/monitor_controller.dart';

class MonitorPage extends StatelessWidget {
  const MonitorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MonitorController controller = Get.put(MonitorController());

    return Scaffold(
      body: Center(
        child: Text(controller.title.value),
      )
    );
  }
}
