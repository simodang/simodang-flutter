import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:simodang_flutter/data/datasources/remote/auth/auth_remote_data_source.dart';
import 'package:simodang_flutter/state/auth_state.dart';
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

      await Get.find<AuthState>().checkToken();
      return;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    try {
      await Get.find<AuthState>().checkToken();
    } catch (e) {
      rethrow;
    }
  }
}
