import 'package:get/get.dart';
import 'package:simodang_flutter/views/chart/chart_binding.dart';
import 'package:simodang_flutter/views/chart/chart_page.dart';
import 'package:simodang_flutter/views/date_picker/date_picker_binding.dart';
import 'package:simodang_flutter/views/date_picker/date_picker_page.dart';
import 'package:simodang_flutter/views/detail/detail_binding.dart';
import 'package:simodang_flutter/views/detail/detail_page.dart';
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
    ),
    GetPage(
      name: '/detail',
      page: () => const DetailPage(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: '/chart/:id',
      page: () => const ChartPage(),
      binding: ChartBinding()
    ),
    GetPage(
      name: '/date-picker',
      page : () => const DatePickerPage(),
      binding: DatePickerBinding(),
    )
  ];
}
