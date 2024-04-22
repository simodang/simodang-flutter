import 'package:get/get.dart';
import 'package:simodang_flutter/views/home/home_binding.dart';
import 'package:simodang_flutter/views/home/home_page.dart';
import 'package:simodang_flutter/views/login/login_binding.dart';
import 'package:simodang_flutter/views/login/login_page.dart';

class Pages {
  static final pages = [
    GetPage(
      name: '/home',
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
      binding: LoginBinding(),
    )
  ];
}