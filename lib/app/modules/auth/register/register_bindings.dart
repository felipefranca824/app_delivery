import 'package:app_delivery/app/modules/auth/register/register_controller.dart';
import 'package:app_delivery/app/repositories/auth/auth_repository.dart';
import 'package:app_delivery/app/repositories/auth/auth_repository_implementation.dart';
import 'package:get/get.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImplementation(
        restClient: Get.find(),
      ),
    );

    Get.lazyPut(
      () => RegisterController(authRepository: Get.find()),
    );
  }
}
