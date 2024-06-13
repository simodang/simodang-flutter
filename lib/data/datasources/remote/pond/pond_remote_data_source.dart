import 'package:simodang_flutter/data/models/create_pond.dart';
import 'package:simodang_flutter/data/models/update_pond.dart';
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

  Future<Pond> getPondById(String id) async {
    try {
      final response = await DioClient().get(
        "/ponds/$id",
      );
      final pond = Pond.fromJson(response.data as Map<String, dynamic>);
      return pond;
    } catch (_) {
      rethrow;
    }
  }

  Future<Pond> createPond(CreatePond pond) async {
    try {
      final response = await DioClient().post(
        "/ponds",
        data: pond.toJson(),
      );
      final newPond = Pond.fromJson(response.data as Map<String, dynamic>);
      return newPond;
    } catch (_) {
      rethrow;
    }
  }

  Future<Pond> updatePond(String id, UpdatePond pond) async {
    try {
      final response = await DioClient().patch(
        "/ponds/$id",
        data: pond.toJson(),
      );
      final updatedPond = Pond.fromJson(response.data as Map<String, dynamic>);
      return updatedPond;
    } catch (_) {
      rethrow;
    }
  }
}
