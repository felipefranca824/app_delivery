import 'package:app_delivery/app/core/services/auth_services.dart';
import 'package:get/get.dart';

class SplahController extends GetxController {
  void checkLogged() {
    Get.putAsync(() => AuthServices().init());
  }
}
