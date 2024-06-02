import 'package:get/get.dart';

class AddPondController extends GetxController {
  RxInt currentStep = 0.obs;

  RxString name = ''.obs;
  RxString address = ''.obs;
  RxString city = ''.obs;
  RxBool isFilled = false.obs;
  RxString deviceId = ''.obs;

  void nextStep() {
    if (currentStep.value == 3) return;
    currentStep.value++;
    update();
  }

  void previousStep() {
    if (currentStep.value == 0) return;
    if (currentStep.value == 2) setDeviceId('');
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
}
