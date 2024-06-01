import 'package:flutter/material.dart';

class PondInfoStep extends StatelessWidget {
  const PondInfoStep({
    super.key,
    required this.setName,
    required this.setAddress,
    required this.setCity,
  });

  final Function(String) setName;
  final Function(String) setAddress;
  final Function(String) setCity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: setName,
          decoration: const InputDecoration(
            labelText: 'Nama',
          ),
        ),
        TextField(
          onChanged: setAddress,
          decoration: const InputDecoration(
            labelText: 'Alamat',
          ),
        ),
        TextField(
          onChanged: setCity,
          decoration: const InputDecoration(
            labelText: 'Kota',
          ),
        ),
      ],
    );
  }
}
