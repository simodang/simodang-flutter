import 'package:get/get.dart';
import 'package:simodang_flutter/data/models/pond.dart';
import 'package:simodang_flutter/state/pond_state.dart';

class MonitorController extends GetxController {
  RxList<Pond> ponds = <Pond>[].obs;

  @override
  void onInit() {
    super.onInit();
    ponds.value = Get.find<PondState>().ponds;
    update();
  }
}
