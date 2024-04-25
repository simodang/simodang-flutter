import 'package:get/get.dart';
import 'package:simodang_flutter/data/models/profile.dart';
import 'package:simodang_flutter/state/auth_state.dart';
import 'package:simodang_flutter/state/profile_state.dart';

class ProfileController extends GetxController {
  Rx<Profile> profile = Profile.empty().obs;

  @override
  void onInit() {
    super.onInit();
    profile.value = Get.find<ProfileState>().profile.value;
  }

  Future<void> logout() async {
    await Get.find<AuthState>().logout();
  }
}
