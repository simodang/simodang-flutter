import 'package:get/get.dart';
import 'package:simodang_flutter/data/models/profile.dart';
import 'package:simodang_flutter/state/profile_state.dart';

class LandingController extends GetxController {
  RxInt hour = DateTime.now().hour.obs;
  Rx<Profile> profile = Profile.empty().obs;

  @override
  void onInit() {
    super.onInit();
    profile.value = Get.find<ProfileState>().profile.value;
  }
}
