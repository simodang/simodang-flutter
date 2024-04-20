import 'package:get/get.dart';
import 'package:simodang_flutter/views/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
