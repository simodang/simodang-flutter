import 'package:flutter/material.dart';

class DetailMenuWidget extends StatelessWidget {
  const DetailMenuWidget({
    super.key,
    required this.isDeviceEditable,
  });

  final bool isDeviceEditable;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            child: Text("Edit Kolam"),
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
