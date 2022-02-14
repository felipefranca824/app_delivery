import 'package:app_delivery/app/core/bindings/application_binding.dart';
import 'package:app_delivery/app/core/ui/vakinha_ui.dart';
import 'package:app_delivery/app/routes/auth_routers.dart';
import 'package:app_delivery/app/routes/home_routers.dart';
import 'package:app_delivery/app/routes/orders_routers.dart';
import 'package:app_delivery/app/routes/product_routers.dart';
import 'package:app_delivery/app/routes/splash_routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const VakinhaBurgerMainApp());
}

class VakinhaBurgerMainApp extends StatelessWidget {
  const VakinhaBurgerMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: VakinhaUI.theme,
      initialBinding: ApplicationBinding(),
      getPages: [
        ...SplashRouters.routers,
        ...AuthRouters.routers,
        ...HomeRouters.routers,
        ...ProductRouters.routers,
        ...OrdersRouters.routers,
      ],
    );
  }
}
