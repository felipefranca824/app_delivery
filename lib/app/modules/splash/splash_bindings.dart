import 'package:app_delivery/app/modules/splash/splah_controller.dart';
import 'package:get/get.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplahController());
  }
}
