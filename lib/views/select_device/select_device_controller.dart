import 'package:get/get.dart';
import 'package:simodang_flutter/data/models/device.dart';
import 'package:simodang_flutter/state/device_state.dart';

class SelectDeviceController extends GetxController {
  RxList<Device> devices = <Device>[].obs;

  void selectDevice(String deviceId) {
    Get.back(result: deviceId);
  }

  Future<void> scanQr() async {
    final result = await Get.toNamed('/qr');
    if (result != null) {
      selectDevice(result);
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await Get.find<DeviceState>().fetchDevices();
    devices.value = Get.find<DeviceState>().devices;
    update();
  }
}
