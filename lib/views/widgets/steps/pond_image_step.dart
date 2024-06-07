import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_flutter/views/widgets/image_picker/image_picker_bottomsheet_widget.dart';
import 'package:simodang_flutter/views/widgets/image_preview/image_preview_widget.dart';

class PondImageStep extends StatelessWidget {
  const PondImageStep({
    super.key,
    required this.imagePath,
    required this.setImagePath
  });

  final String imagePath;
  final void Function(String) setImagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilledButton(
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(40)
          ),
          child: const Text('Pilih Gambar'),
          onPressed: () async {
            final imagePath = await Get.bottomSheet(
              const ImagePickerBottomSheetWidget()
            );
            if (imagePath != null) {
              setImagePath(imagePath);
            }
          }
        ),
        const SizedBox(height: 10),
        ImagePreviewWidget(
          imagePath: imagePath,
        )
      ],
    );
  }
}
