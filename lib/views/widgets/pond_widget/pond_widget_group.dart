import 'package:flutter/material.dart';
import 'package:simodang_flutter/views/widgets/pond_widget/pond_condition_widget.dart';
import 'package:simodang_flutter/views/widgets/pond_widget/pond_seed_widget.dart';

class PondWidgetGroup extends StatelessWidget {
  const PondWidgetGroup({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.isFilled,
    required this.status,
    required this.seedDate,
    required this.seedCount,
  });

  final String imageUrl;
  final String name;
  final String address;
  final bool isFilled;
  final bool status;
  final String seedDate;
  final int seedCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            imageUrl,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          address,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        PondConditionWidget(
          isFilled: isFilled,
          status: status,
        ),
        const SizedBox(height: 15),
        PondSeedWidget(
          seedDate: seedDate,
          seedCount: seedCount,
        )
      ],
    );
  }
}
