import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_flutter/views/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
          ),
          body: Center(
            child: Column(
              children: [
                const Spacer(),
                const Text(
                  "Selamat Datang",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text("Atur kolam anda dari manapun dan kapanpun"),
                const SizedBox(height: 30),
                FilledButton(
                  onPressed: () async {
                    controller.authSnackbar();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue
                  ),
                  child: const Text("Masuk"),
                ),
                FilledButton(
                  onPressed: () {
                    controller.authSnackbar();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue
                  ),
                  child: const Text("Daftar"),
                ),
                const SizedBox(height: 10),
                const Text("Masuk dengan"),
                IconButton(
                  onPressed: () async {
                    controller.getGoogleUid();
                  },
                  icon: Image.network(
                    "http://pngimg.com/uploads/google/google_PNG19635.png",
                    width: 50,
                    height: 50,
                  )
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }
}
