import 'package:get/get.dart';
import 'package:simodang_flutter/views/qr/qr_controller.dart';

class QrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrController>(() => QrController());
  }
}
