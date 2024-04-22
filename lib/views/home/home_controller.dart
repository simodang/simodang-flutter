import 'package:get/get.dart';
import 'package:simodang_flutter/data/models/profile.dart';
import 'package:simodang_flutter/state/profile_state.dart';
import 'package:simodang_flutter/utils/secure_storage/secure_storage_singleton.dart';

class HomeController extends GetxController {
  Rx<Profile> profile = Profile.empty().obs;

  void logout() async {
    await SecureStorageSingleton().storage.delete(key: 'jwt');
    Get.offAllNamed('/login');
    Get.find<ProfileState>().resetProfile();
  }

  @override
  void onInit() {
    super.onInit();
    profile.value = Get.find<ProfileState>().profile.value;
  }
}
