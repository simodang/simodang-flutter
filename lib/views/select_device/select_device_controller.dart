import 'package:get/get.dart';
import 'package:simodang_flutter/data/models/device.dart';
import 'package:simodang_flutter/state/device_state.dart';

class SelectDeviceController extends GetxController {
  RxList<Device> devices = <Device>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await Get.find<DeviceState>().fetchDevices();
    devices.value = Get.find<DeviceState>().devices;
    update();
  }
}
