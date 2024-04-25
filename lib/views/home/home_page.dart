import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_flutter/views/home/home_controller.dart';
import 'package:simodang_flutter/views/landing/landing_page.dart';
import 'package:simodang_flutter/views/monitor/monitor_page.dart';
import 'package:simodang_flutter/views/profile/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder:(controller) {
        final List<Widget> subpages = <Widget>[
          const LandingPage(),
          const MonitorPage(),
          const ProfilePage(),
        ];

        return Scaffold(
          body: Center(
            child: subpages.elementAt(controller.currentIndex.value),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.monitor),
                label: 'Monitor',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
