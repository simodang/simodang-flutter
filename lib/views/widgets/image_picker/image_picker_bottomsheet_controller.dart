import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBottomSheetController extends GetxController {
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
      imageQuality: 25,
    );
    if (pickedFile != null) {
      Get.back(result: pickedFile.path);
      return;
    }
    Get.back();
  }
}
