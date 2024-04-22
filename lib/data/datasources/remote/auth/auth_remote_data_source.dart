import 'package:simodang_flutter/data/models/token.dart';
import 'package:simodang_flutter/data/models/profile.dart';
import 'package:simodang_flutter/utils/dio/dio_client.dart';

class AuthRemoteDataSource {
  Future<Token> login(String uid) async {
    try {
      final response = await DioClient().post(
        "/auth/v2/$uid",
      );
      final token = Token.fromJson(response.data as Map<String, dynamic>);
      return token;
    } catch (_) {
      rethrow;
    }
  }

  Future<Profile> getProfile() async {
    try {
      final response = await DioClient().get(
        "/users/profile",
      );
      final user = Profile.fromJson(response.data as Map<String, dynamic>);
      return user;
    } catch (_) {
      rethrow;
    }
  }
}
