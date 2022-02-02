import 'package:app_delivery/app/modules/splash/splash_bindings.dart';
import 'package:app_delivery/app/modules/splash/splash_page.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SplashRouters {
  SplashRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/',
      binding: SplashBindings(),
      page: () => const SplashPage(),
    ),
  ];
}
