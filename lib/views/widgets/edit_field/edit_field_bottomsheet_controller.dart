import 'package:get/get.dart';

class EditFieldBottomSheetController extends GetxController {
  RxString newValue = RxString("");

  void updateValue(String text) {
    newValue.value = text;
  }

  void save() {
    Get.back(result: newValue.value);
  }
}
