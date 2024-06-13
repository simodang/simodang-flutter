import 'package:get/get.dart';
import 'package:simodang_flutter/views/edit_pond/edit_pond_controller.dart';

class EditPondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditPondController>(() => EditPondController());
  }
}
