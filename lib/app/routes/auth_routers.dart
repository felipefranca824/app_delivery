import 'package:app_delivery/app/modules/login/login_page.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AuthRouters {
  AuthRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/auth/login',
      page: () => const LoginPage(),
    )
  ];
}
