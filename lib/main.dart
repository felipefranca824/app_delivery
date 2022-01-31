import 'package:app_delivery/app/core/ui/vakinha_ui.dart';
import 'package:app_delivery/app/routes/splash_routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const VakinhaBurgerMainApp());
}

class VakinhaBurgerMainApp extends StatelessWidget {
  const VakinhaBurgerMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: VakinhaUI.theme,
      getPages: [
        ...SplashRouters.routers,
      ],
    );
  }
}
