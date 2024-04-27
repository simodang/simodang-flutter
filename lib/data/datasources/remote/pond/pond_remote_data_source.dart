import 'package:simodang_flutter/data/models/pond.dart';
import 'package:simodang_flutter/utils/dio/dio_client.dart';

class PondRemoteDataSource {
  Future<List<Pond>> getPonds() async {
    try {
      final response = await DioClient().get(
        "/ponds",
      );
      final ponds = (response.data as List)
          .map((e) => Pond.fromJson(e as Map<String, dynamic>))
          .toList();
      return ponds;
    } catch (_) {
      rethrow;
    }
  }
}
