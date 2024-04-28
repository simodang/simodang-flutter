import 'package:get/get.dart';
import 'package:simodang_flutter/data/datasources/remote/pond/pond_remote_data_source.dart';
import 'package:simodang_flutter/data/models/pond.dart';

class DetailController extends GetxController {
  final String? pondId = Get.arguments['pondId'];
  Rxn<Pond> pond = Rxn<Pond>();

  Future<void> fetchPond() async {
    if (pondId == null) {
      return;
    }
    final pond = await PondRemoteDataSource().getPondById(pondId ?? "");
    this.pond.value = pond;
  }

  @override
  void onInit() async {
    super.onInit();
    await fetchPond();
    update();
  }
}
