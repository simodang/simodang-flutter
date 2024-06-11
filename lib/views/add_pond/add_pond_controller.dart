import 'package:get/get.dart';
import 'package:simodang_flutter/data/datasources/remote/pond/pond_remote_data_source.dart';
import 'package:simodang_flutter/data/models/create_pond.dart';
import 'package:simodang_flutter/state/pond_state.dart';
import 'package:simodang_flutter/utils/firebase_upload/firebase_upload.dart';

class AddPondController extends GetxController {
  RxInt currentStep = 0.obs;

  RxString name = ''.obs;
  RxString address = ''.obs;
  RxString city = ''.obs;
  RxBool isFilled = false.obs;
  RxString deviceId = ''.obs;
  RxString imagePath = ''.obs;
  RxString uploadedUrl = ''.obs;

  void nextStep() {
    if (currentStep.value == 4) {
      submit();
      return;
    }
    currentStep.value++;
    update();
  }

  void previousStep() {
    if (currentStep.value == 0) return;
    if (currentStep.value == 2) setDeviceId('');
    if (currentStep.value == 3) setImagePath('');
    currentStep.value--;
    update();
  }

  void tapStep(int index) {
    currentStep.value = index;
    update();
  }

  void setName(String value) {
    name.value = value;
    update();
  }

  void setAddress(String value) {
    address.value = value;
    update();
  }

  void setCity(String value) {
    city.value = value;
    update();
  }

  void setIsFilled(bool value) {
    isFilled.value = value;
    update();
  }

  void setDeviceId(String value) {
    deviceId.value = value;
    update();
  }

  void setImagePath(String value) {
    imagePath.value = value;
    update();
  }

  void setUploadedUrl(String value) {
    uploadedUrl.value = value;
  }

  bool get isStep1Valid => name.isNotEmpty && address.isNotEmpty && city.isNotEmpty;

  Future<void> submit() async {
    if (!isStep1Valid) {
      Get.snackbar('Error', 'Please fill all fields');
      return;
    }

    if (imagePath.isNotEmpty) {
      final url = await FirebaseUpload().uploadImage(imagePath.value);
      setUploadedUrl(url);
    }

    final pond = CreatePond(
      name: name.value,
      address: address.value,
      city: city.value,
      isFilled: isFilled.value,
      deviceId: deviceId.value == '' ? null : deviceId.value,
      imageUrl: uploadedUrl.value == '' ? 'https://placehold.co/600x400/png' : uploadedUrl.value,
    );

    try {
      await PondRemoteDataSource().createPond(pond);
      await Get.find<PondState>().fetchPonds();
      Get.back();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
