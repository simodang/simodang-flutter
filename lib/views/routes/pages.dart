import 'package:get/get.dart';
import 'package:simodang_flutter/views/login/login_binding.dart';
import 'package:simodang_flutter/views/login/login_page.dart';

class Pages {
  static final pages = [
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
      binding: LoginBinding(),
    )
  ];
}