import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simodang_flutter/views/widgets/edit_field/edit_field_bottomsheet_controller.dart';

class EditFieldBottomSheetWidget extends StatelessWidget {
  const EditFieldBottomSheetWidget({
    super.key,
    required this.fieldName,
    required this.oldValue,
    this.numberOnly = false,
  });

  final String fieldName;
  final String oldValue;
  final bool numberOnly;

  @override
  Widget build(BuildContext context) {
    Get.put(EditFieldBottomSheetController());

    return GetBuilder<EditFieldBottomSheetController>(
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                "Edit $fieldName",
                style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                inputFormatters: [
                  if (numberOnly) FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (text) {
                  controller.updateValue(text);
                },
                decoration: InputDecoration(
                  hintText: oldValue,
                ),
              ),
              const SizedBox(height: 10),
              FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(40)
                ),
                onPressed: controller.save,
                child: const Text('Simpan'),
              )
            ],
          ),
        );
      },
    );
  }
}
