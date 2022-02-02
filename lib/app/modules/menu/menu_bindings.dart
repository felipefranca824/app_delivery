import 'package:app_delivery/app/repositories/product/product_repository.dart';
import 'package:app_delivery/app/repositories/product/product_repository_interface.dart';
import 'package:get/get.dart';
import './menu_controller.dart';

class MenuBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRepositoryInterface>(
        () => ProductRepository(restClient: Get.find()));
    Get.put(MenuController(productRepository: Get.find()));
  }
}
