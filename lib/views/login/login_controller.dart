import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:simodang_flutter/data/datasources/remote/auth/auth_remote_data_source.dart';
import 'package:simodang_flutter/data/models/profile.dart';
import 'package:simodang_flutter/state/profile_state.dart';
import 'package:simodang_flutter/utils/logger/logger_singleton.dart';
import 'package:simodang_flutter/utils/secure_storage/secure_storage_singleton.dart';

class LoginController extends GetxController {
  RxBool isLoading = true.obs;

  void authSnackbar() {
    Get.snackbar("Peringatan", "Silahkan gunakan akun Google anda");
  }

  Future<void> getGoogleUid() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final result = await FirebaseAuth.instance.signInWithCredential(credential);

      await GoogleSignIn().disconnect();
      await FirebaseAuth.instance.signOut();

      final token = await AuthRemoteDataSource().login(result.user!.uid);
      SecureStorageSingleton().storage.write(key: 'jwt', value: token.token);

      goToHome();
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<Profile> getProfile() async {
    try {
      final profile = await AuthRemoteDataSource().getProfile();
      LoggerSingleton().logger.i(profile);
      return profile;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> goToHome() async {
    final token = await SecureStorageSingleton().storage.read(key: 'jwt');
    if (token != null) {
      final profile = await getProfile();
      Get.find<ProfileState>().setProfile(profile);
      Get.offAllNamed('/home');
    }
  }

  @override
  void onReady() async {
    super.onReady();
    goToHome();
  }
}
