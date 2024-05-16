import 'package:get/get.dart';
import 'package:simodang_flutter/views/date_picker/date_picker_controller.dart';

class DatePickerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DatePickerController());
  }
}
