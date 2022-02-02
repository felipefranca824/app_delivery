import 'package:app_delivery/app/core/services/auth_services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
          child: TextButton(
        onPressed: () {
          Get.find<AuthServices>().logout();
        },
        child: const Text('logout'),
      )),
    );
  }
}
