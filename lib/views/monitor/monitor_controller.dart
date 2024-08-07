import 'package:get/get.dart';
import 'package:simodang_flutter/data/models/pond.dart';
import 'package:simodang_flutter/state/pond_state.dart';

class MonitorController extends GetxController {
  RxList<Pond> ponds = <Pond>[].obs;

  void addPond() {
    Get.toNamed('/add-pond');
  }

  @override
  void onReady() {
    super.onReady();
    ponds.value = Get.find<PondState>().ponds;
    update();

    ever(Get.find<PondState>().ponds, (_) {
      update();
    });
  }
}
