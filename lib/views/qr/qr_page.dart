import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_mobile_vision/qr_camera.dart';
import 'package:simodang_flutter/views/qr/qr_controller.dart';

class QrPage extends StatelessWidget {
  const QrPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QrController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('QR Code'),
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  controller.getQrLabel(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: QrCamera(
                    onError: (context, error) => Text(
                      error.toString(),
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    qrCodeCallback: (value) => controller.setQrCode(value ?? ''),
                  ),
                )
              ]
            ),
          ),
          floatingActionButton: Visibility(
            visible: controller.qrCode.value != '',
            child: FloatingActionButton(
              onPressed: controller.returnQrCode,
              child: const Icon(Icons.arrow_forward),
            ),
          )
        );
      },
    );
  }
}
