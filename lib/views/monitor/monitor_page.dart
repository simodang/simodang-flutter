import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_flutter/views/monitor/monitor_controller.dart';
import 'package:simodang_flutter/views/widgets/grid/pond_grid_widget.dart';

class MonitorPage extends StatelessWidget {
  const MonitorPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MonitorController());

    return GetBuilder<MonitorController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 20,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Flexible(
                  child: PondGridWidget(
                    ponds: controller.ponds
                  ),
                )
              ],
            )
          )
        );
      },
    );
  }
}
