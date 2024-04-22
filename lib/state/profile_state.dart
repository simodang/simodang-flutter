import 'package:get/get.dart';
import 'package:simodang_flutter/data/models/profile.dart';

class ProfileState extends GetxController {
  Rx<Profile> profile = Profile.empty().obs;

  void setProfile(Profile newProfile) {
    profile.value = newProfile;
  }

  void resetProfile() {
    profile.value = Profile.empty();
  }
}
