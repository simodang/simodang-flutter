import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simodang_flutter/views/widgets/image_picker/image_picker_bottomsheet_controller.dart';

class ImagePickerBottomSheetWidget extends StatelessWidget {
  const ImagePickerBottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ImagePickerBottomSheetController());

    return GetBuilder<ImagePickerBottomSheetController>(
      builder: (controller) {
        return Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Kamera'),
                onTap: () {
                  controller.pickImage(ImageSource.camera);
                },
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Galeri'),
                onTap: () {
                  controller.pickImage(ImageSource.gallery);
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
