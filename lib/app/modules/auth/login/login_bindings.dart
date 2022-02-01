import 'package:app_delivery/app/repositories/auth/auth_repository.dart';
import 'package:app_delivery/app/repositories/auth/auth_repository_implementation.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImplementation(
        restClient: Get.find(),
      ),
    );

    Get.lazyPut(
      () => LoginController(authRepository: Get.find()),
    );
  }
}
