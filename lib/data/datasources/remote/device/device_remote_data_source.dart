import 'package:simodang_flutter/data/models/device.dart';
import 'package:simodang_flutter/utils/dio/dio_client.dart';

class DeviceRemoteDataSource {
  Future<List<Device>> getDevices() async {
    try {
      final response = await DioClient().get(
        "/devices",
      );
      final devices = (response.data as List)
          .map((e) => Device.fromJson(e as Map<String, dynamic>))
          .toList();
      return devices;
    } catch (_) {
      rethrow;
    }
  }
}
