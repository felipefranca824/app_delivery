import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const VakinhaBurgerApp());
}

class VakinhaBurgerApp extends StatelessWidget {
  const VakinhaBurgerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp();
  }
}
