import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:simodang_flutter/firebase_options.dart';
import 'package:simodang_flutter/state/auth_state.dart';
import 'package:simodang_flutter/state/device_state.dart';
import 'package:simodang_flutter/state/pond_state.dart';
import 'package:simodang_flutter/state/profile_state.dart';
import 'package:simodang_flutter/views/routes/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");

  Get.put(AuthState(), permanent: true);
  Get.put(ProfileState(), permanent: true);
  Get.put(PondState(), permanent: true);
  Get.put(DeviceState(), permanent: true);

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      getPages: Pages.pages,
    ),
  );
}
