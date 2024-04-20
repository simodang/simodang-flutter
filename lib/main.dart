import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_flutter/views/routes/pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      getPages: Pages.pages,
    ),
  );
}
