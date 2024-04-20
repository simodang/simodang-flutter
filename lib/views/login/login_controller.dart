import 'package:get/get.dart';

class LoginController extends GetxController {
  void authSnackbar() {
    Get.snackbar("Peringatan", "Silahkan gunakan akun Google anda");
  }
}
