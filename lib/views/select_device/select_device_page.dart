import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_flutter/views/select_device/select_device_controller.dart';

class SelectDevicePage extends StatelessWidget {
  const SelectDevicePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(SelectDeviceController());

    return GetBuilder<SelectDeviceController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Pilih Perangkat'),
          ),
          body: ListView.builder(
            itemCount: controller.devices.length,
            itemBuilder: (context, index) {
              final device = controller.devices[index];
              return ListTile(
                title: Text(device.name),
                subtitle: Text(device.id),
                onTap: () {
                  controller.selectDevice(device.id);
                },
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: controller.scanQr,
            child: const Icon(Icons.qr_code),
          )
        );
      },
    );
  }
}
