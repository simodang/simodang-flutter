import 'package:flutter/material.dart';
import 'package:simodang_flutter/views/widgets/label/column_label_widget.dart';

class PondConfirmStep extends StatelessWidget {
  const PondConfirmStep({
    super.key,
    required this.name,
    required this.address,
    required this.city,
    required this.isFilled,
    required this.deviceId,
    required this.imagePath,
  });

  final String name;
  final String address;
  final String city;
  final bool isFilled;
  final String deviceId;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColumnLabelWidget(
          label: 'Nama',
          value: name,
        ),
        const SizedBox(height: 10),
        ColumnLabelWidget(
          label: 'Alamat',
          value: address,
        ),
        const SizedBox(height: 10),
        ColumnLabelWidget(
          label: 'Kota',
          value: city,
        ),
        const SizedBox(height: 10),
        ColumnLabelWidget(
          label: 'Status',
          value: isFilled ? 'Terisi' : 'Kosong',
        ),
        const SizedBox(height: 10),
        ColumnLabelWidget(
          label: 'Perangkat',
          value: deviceId == '' ? 'Tidak ada' : deviceId,
        ),
        const SizedBox(height: 10),
        ColumnLabelWidget(
          label: 'Gambar',
          value: imagePath == '' ? 'Tidak Terpasang' : 'Terpasang',
        ),
      ],
    );
  }
}
