import 'package:app_delivery/app/modules/splash/splash_page.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SplashRouters {
  SplashRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/',
      page: () => const SplashPage(),
    ),
  ];
}
