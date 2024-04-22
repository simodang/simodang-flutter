import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_flutter/views/home/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder:(controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Home Page"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Name: ${controller.profile.value.name}"),
                Text("Email: ${controller.profile.value.email}"),
                ElevatedButton(
                  onPressed: () {
                    controller.logout();
                  },
                  child: const Text("Logout"),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
