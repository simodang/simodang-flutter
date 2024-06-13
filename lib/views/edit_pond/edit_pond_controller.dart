import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simodang_flutter/data/datasources/remote/pond/pond_remote_data_source.dart';
import 'package:simodang_flutter/data/models/pond.dart';
import 'package:simodang_flutter/data/models/update_pond.dart';
import 'package:simodang_flutter/state/pond_state.dart';

class EditPondController extends GetxController {
  final String? pondId = Get.arguments['pondId'];
  Rxn<Pond> pond = Rxn<Pond>();
  RxString name = RxString("");
  RxString address = RxString("");
  RxString city = RxString("");
  RxString imageUrl = RxString("https://placehold.co/600x400/png");
  RxInt seedCount = RxInt(0);
  RxString seedDate = RxString(DateTime.now().toString());
  RxBool isFilled = RxBool(false);
  RxString deviceId = RxString("");

  RxBool isImageChanged = RxBool(false);

  Future<void> fetchPond() async {
    if (pondId == null) {
      return;
    }
    final pond = await PondRemoteDataSource().getPondById(pondId ?? "");
    this.pond.value = pond;
  }

  void assignPondData() {
    if (pond.value == null) {
      return;
    }
    name.value = pond.value!.name;
    address.value = pond.value!.address;
    city.value = pond.value!.city;
    imageUrl.value = pond.value!.imageUrl;
    seedCount.value = pond.value!.seedCount;
    seedDate.value = pond.value!.seedDate;
    isFilled.value = pond.value!.isFilled;
    deviceId.value = pond.value!.deviceId ?? "";
  }

  void setName(result) {
    if (result != null) {
      name.value = result;
      update();
    }
  }

  void setAddress(result) {
    if (result != null) {
      address.value = result;
      update();
    }
  }

  void setCity(result) {
    if (result != null) {
      city.value = result;
      update();
    }
  }

  void setImageUrl(result) {
    if (result != null) {
      imageUrl.value = result;
      isImageChanged.value = true;
      update();
    }
  }

  void setSeedCount(result) {
    if (result != null) {
      seedCount.value = int.parse(result);
      update();
    }
  }

  void setSeedDate(result) {
    if (result != null) {
      final parsedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(result);
      seedDate.value = parsedDate;
      update();
    }
  }

  void setIsFilled(bool value) {
    isFilled.value = value;
    update();
  }

  Future<void> submit() async {
    final updatePond = UpdatePond(
      name: name.value,
      address: address.value,
      city: city.value,
      isFilled: isFilled.value,
      deviceId: deviceId.value,
      imageUrl: imageUrl.value,
      seedDate: seedDate.value,
      seedCount: seedCount.value,
    );

    try {
      await PondRemoteDataSource().updatePond(pondId ?? "", updatePond);
      await Get.find<PondState>().fetchPonds();
      Get.back();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await fetchPond();
    assignPondData();
    update();
  }
}
