import 'package:get/get.dart';
import 'package:simodang_flutter/data/models/pond.dart';
import 'package:simodang_flutter/data/models/profile.dart';
import 'package:simodang_flutter/state/pond_state.dart';
import 'package:simodang_flutter/state/profile_state.dart';

class LandingController extends GetxController {
  RxInt hour = DateTime.now().hour.obs;
  Rx<Profile> profile = Profile.empty().obs;
  RxList<Pond> ponds = <Pond>[].obs;

  RxInt pondCount = 0.obs;
  RxInt seedCount = 0.obs;
  RxInt warningCount = 0.obs;

  int getSeedCount(List<Pond> ponds) {
    return ponds
      .fold(0, (sum, pond) => sum + pond.seedCount);
  }

  int getWarningCount(List<Pond> ponds) {
    return ponds
      .where((pond) => pond.status == false).length;
  }

  @override
  void onReady() {
    super.onReady();
    profile.value = Get.find<ProfileState>().profile.value;
    ponds.value = Get.find<PondState>().ponds;

    pondCount.value = ponds.length;
    seedCount.value = getSeedCount(ponds);
    warningCount.value = getWarningCount(ponds);

    update();
  }
}
