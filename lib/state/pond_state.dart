import 'package:get/get.dart';
import 'package:simodang_flutter/data/datasources/remote/pond/pond_remote_data_source.dart';
import 'package:simodang_flutter/data/models/pond.dart';

class PondState extends GetxController {
  RxList<Pond> ponds = <Pond>[].obs;

  void setPonds(List<Pond> newPonds) {
    ponds.value = newPonds;
  }

  Future<void> fetchPonds() async {
    final ponds = await PondRemoteDataSource().getPonds();
    setPonds(ponds);
  }
}
