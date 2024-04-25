import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_flutter/views/landing/landing_controller.dart';
import 'package:simodang_flutter/views/widgets/greeting/greeting_widget.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LandingController controller = Get.put(LandingController());

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 20,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              return GreetingWidget(
                hourParam: controller.hour.value,
                name: controller.profile.value.name,
              );
            }),
          ],
        ),
      ),
    );
  }
}
