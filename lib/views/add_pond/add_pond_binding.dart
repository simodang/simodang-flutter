import 'package:get/get.dart';
import 'package:simodang_flutter/views/add_pond/add_pond_controller.dart';

class AddPondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPondController>(() => AddPondController());
  }
}
