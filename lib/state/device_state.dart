import 'package:get/get.dart';
import 'package:simodang_flutter/data/datasources/remote/device/device_remote_data_source.dart';
import 'package:simodang_flutter/data/models/device.dart';

class DeviceState extends GetxController {
  RxList<Device> devices = <Device>[].obs;

  void setDevices(List<Device> newDevices) {
    devices.value = newDevices;
  }

  Future<void> fetchDevices() async {
    final devices = await DeviceRemoteDataSource().getDevices();
    setDevices(devices);
  }
}
