import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailMenuWidget extends StatelessWidget {
  const DetailMenuWidget({
    super.key,
    required this.pondId,
    required this.isDeviceEditable,
  });

  final String pondId;
  final bool isDeviceEditable;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: const Text("Edit Kolam"),
            onTap: () {
              Get.toNamed('/edit-pond', arguments: {
                'pondId': pondId,
              });
            },
          ),
          PopupMenuItem(
            enabled: isDeviceEditable,
            child: const Text("Atur Perangkat"),
          ),
        ];
      },
    );
  }
}
