import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_flutter/views/profile/profile_controller.dart';
import 'package:simodang_flutter/views/widgets/label/row_label_widget.dart';
import 'package:simodang_flutter/views/widgets/profile/profile_widget.dart';
import 'package:simodang_flutter/views/widgets/text/list_text_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 20,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Obx(() {
                  return ProfileWidget(
                    name: controller.profile.value.name,
                    email: controller.profile.value.email,
                    photo: controller.profile.value.photo,
                  );
                }),
                const SizedBox(height: 20),
                Obx(() {
                  return RowLabelWidget(
                    label: "Alamat",
                    value: controller.profile.value.address,
                  );
                }),
                const SizedBox(height: 10),
                Obx(() {
                  return RowLabelWidget(
                    label: "No. HP",
                    value: controller.profile.value.phoneNum,
                  );
                }),
              ],
            )
          ),
          const SizedBox(height: 20),
          const ListTextWidget(text: "Akun"),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Keluar'),
            onTap: () => controller.logout(),
          )
        ],
      )
    );
  }
}
