import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_flutter/views/detail/detail_controller.dart';
import 'package:simodang_flutter/views/widgets/detail_widget/metric_stats_widget.dart';
import 'package:simodang_flutter/views/widgets/menu/detail_menu_widget.dart';
import 'package:simodang_flutter/views/widgets/pond_widget/pond_widget_group.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              if (controller.pond.value != null)
                DetailMenuWidget(
                  pondId: controller.pond.value?.id ?? "",
                  isDeviceEditable: controller.pond.value?.deviceId != null,
                )
            ],
          ),
          body: Container(
            margin: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Container(
                child: () {
                  if (controller.pond.value == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Column(
                      children: [
                        PondWidgetGroup(
                          imageUrl: controller.pond.value?.imageUrl ?? "",
                          name: controller.pond.value?.name ?? "",
                          address: controller.pond.value?.address ?? "",
                          isFilled: controller.pond.value?.isFilled ?? false,
                          status: controller.pond.value?.status ?? false,
                          seedDate: controller.pond.value?.seedDate ?? "",
                          seedCount: controller.pond.value?.seedCount ?? 0,
                        ),
                        const SizedBox(height: 15),
                        MetricStatsWidget(
                          pondId: controller.pond.value?.id ?? "",
                        ),
                      ],
                    );
                  }
                }()),
              ),
            ),
          );
      },
    );
  }
}
