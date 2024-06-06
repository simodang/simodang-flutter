import 'package:get/get.dart';

class QrController extends GetxController {
  RxString qrCode = ''.obs;

  void setQrCode(String code) {
    qrCode.value = code;
    update();
  }

  String getQrLabel() {
    if (qrCode.value == '') {
      return 'Scan QR Code';
    }
    return qrCode.value;
  }

  void returnQrCode() {
    Get.back(result: qrCode.value);
  }
}
