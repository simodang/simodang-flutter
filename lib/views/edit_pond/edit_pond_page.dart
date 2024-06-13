import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simodang_flutter/views/edit_pond/edit_pond_controller.dart';
import 'package:simodang_flutter/views/widgets/dialog/confirmation_dialog_bottomsheet_widget.dart';
import 'package:simodang_flutter/views/widgets/edit_field/edit_field_bottomsheet_widget.dart';
import 'package:simodang_flutter/views/widgets/image_picker/image_picker_bottomsheet_widget.dart';
import 'package:simodang_flutter/views/widgets/text/list_text_widget.dart';

class EditPondPage extends StatelessWidget {
  const EditPondPage({
    super.key,
  });

  ImageProvider<Object> getImageProvider(bool isChanged, String imageUrl) {
    if (isChanged) {
      return FileImage(File(imageUrl));
    } else {
      return NetworkImage(imageUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditPondController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Edit Kolam'),
          ),
          body: controller.pond.value == null ? const Center(child:
            CircularProgressIndicator()
          ) :
          ListView(
            children: [
              Image(
                image: getImageProvider(
                    controller.isImageChanged.value,
                    controller.imageUrl.value
                ),
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              const ListTextWidget(
                text: "Informasi Umum"
              ),
              ListTile(
                title: const Text('Nama'),
                subtitle: Text(controller.name.value),
                onTap: () async {
                  final result = await Get.bottomSheet(
                    EditFieldBottomSheetWidget(
                      fieldName: "Nama",
                      oldValue: controller.name.value,
                    )
                  );
                  controller.setName(result);
                },
              ),
              ListTile(
                title: const Text('Alamat'),
                subtitle: Text(controller.address.value),
                onTap: () async {
                  final result = await Get.bottomSheet(
                    EditFieldBottomSheetWidget(
                      fieldName: "Alamat",
                      oldValue: controller.address.value,
                    )
                  );
                  controller.setAddress(result);
                },
              ),
              ListTile(
                title: const Text("Kota"),
                subtitle: Text(controller.city.value),
                onTap: () async {
                  final result = await Get.bottomSheet(
                    EditFieldBottomSheetWidget(
                      fieldName: "Kota",
                      oldValue: controller.city.value,
                    )
                  );
                  controller.setCity(result);
                },
              ),
              ListTile(
                title: const Text("Gambar"),
                subtitle: const Text("Ubah Gambar Kolam"),
                onTap: () async {
                  final result = await Get.bottomSheet(
                    const ImagePickerBottomSheetWidget()
                  );
                  if (result != null) {
                    controller.setImageUrl(result);
                  }
                },
              ),
              const ListTextWidget(
                text: "Informasi Benih"
              ),
              ListTile(
                title: const Text("Jumlah Benih"),
                subtitle: Text(controller.seedCount.value.toString()),
                onTap: () async {
                  final result = await Get.bottomSheet(
                    EditFieldBottomSheetWidget(
                      fieldName: "Jumlah Benih",
                      oldValue: controller.seedCount.value.toString(),
                      numberOnly: true,
                    )
                  );
                  controller.setSeedCount(result);
                },
              ),
              ListTile(
                title: const Text("Tanggal Masuk"),
                subtitle: Text(DateFormat('dd MMMM yyyy')
                    .format(DateTime.parse(controller.seedDate.value))),
                onTap: () async {
                  final result = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  controller.setSeedDate(result);
                }
              ),
              SwitchListTile(
                title: const Text("Kolam Terisi"),
                value: controller.isFilled.value,
                onChanged: (value) {
                  controller.setIsFilled(value);
                },
              ),
              const ListTextWidget(
                text: "Informasi Perangkat"
              ),
              ListTile(
                title: const Text("Perangkat"),
                subtitle: Text(controller.deviceId.value == "" ? "Tidak ada" : controller.deviceId.value),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.bottomSheet(
                ConfirmationDialogBottomSheetWidget(
                  title: "Simpan Perubahan",
                  message: "Apakah Anda yakin ingin menyimpan perubahan?",
                  onConfirm: () {
                    controller.submit();
                    Get.back();
                  },
                  onCancel: () {
                    Get.back();
                  },

                )
              );
            },
            child: const Icon(Icons.save),
          ),
        );
      }
    );
  }
}
