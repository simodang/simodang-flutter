import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_flutter/views/landing/landing_controller.dart';
import 'package:simodang_flutter/views/widgets/greeting/greeting_widget.dart';
import 'package:simodang_flutter/views/widgets/grid/pond_horizontal_grid_widget.dart';
import 'package:simodang_flutter/views/widgets/stat/stat_widget.dart';
import 'package:simodang_flutter/views/widgets/title/title_button_widget.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LandingController());

    return GetBuilder<LandingController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 20,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GreetingWidget(
                  hourParam: controller.hour.value,
                  name: controller.profile.value.name,
                ),
                const SizedBox(height: 15),
                StatWidget(
                  pondCount: controller.pondCount.value,
                  seedCount: controller.seedCount.value,
                  warningCount: controller.warningCount.value,
                ),
                const TitleButtonWidget(
                  title: 'Kolam',
                  buttonText: 'Lihat Semua',
                ),
                SizedBox(
                  height: 200,
                  child: PondHorizontalGridWidget(
                    ponds: controller.ponds,
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
