import 'package:get/get.dart';
import 'package:simodang_flutter/data/datasources/remote/auth/auth_remote_data_source.dart';
import 'package:simodang_flutter/state/pond_state.dart';
import 'package:simodang_flutter/state/profile_state.dart';
import 'package:simodang_flutter/utils/logger/logger_singleton.dart';
import 'package:simodang_flutter/utils/secure_storage/secure_storage_singleton.dart';

class AuthState extends GetxController {
  RxBool isAuthenticated = false.obs;

  Future<void> checkToken() async {
    try {
      final token = await SecureStorageSingleton().storage.read(key: 'jwt');
      if (token != null) {
        final profile = await AuthRemoteDataSource().getProfile();
        Get.find<ProfileState>().setProfile(profile);

        await Get.find<PondState>().fetchPonds();
        
        isAuthenticated.value = true;
        Get.offAllNamed('/home');
      }
    } catch (e) {
      LoggerSingleton().logger.e(e);
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await SecureStorageSingleton().storage.delete(key: 'jwt');
      isAuthenticated.value = false;
      Get.find<ProfileState>().resetProfile();
      Get.offAllNamed('/login');
    } catch (e) {
      LoggerSingleton().logger.e(e);
      rethrow;
    }
  }
}
