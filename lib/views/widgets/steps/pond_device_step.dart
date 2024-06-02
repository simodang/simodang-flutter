import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_flutter/views/widgets/label/row_label_widget.dart';

class PondDeviceStep extends StatelessWidget {
  const PondDeviceStep({
    super.key,
    required this.deviceId,
    required this.setDeviceId
  });

  final String deviceId;
  final void Function(String) setDeviceId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowLabelWidget(
          label: 'Perangkat',
          value: deviceId == '' ? '-' : deviceId,
        ),
        const SizedBox(height: 10),
        FilledButton(
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(40)
          ),
          child: const Text('Pilih Perangkat'),
          onPressed: () async {
            var result = await Get.toNamed('/select-device');
            if (result != null) {
              setDeviceId(result);
            }
          }
        ),
      ],
    );
  }
}
