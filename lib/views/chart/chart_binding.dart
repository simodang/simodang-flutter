import 'package:get/get.dart';
import 'package:simodang_flutter/views/chart/chart_controller.dart';

class ChartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChartController>(() => ChartController());
  }
}
