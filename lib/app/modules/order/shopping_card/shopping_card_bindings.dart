import 'package:app_delivery/app/repositories/order/order_repository.dart';
import 'package:app_delivery/app/repositories/order/order_repository_implementation.dart';
import 'package:get/get.dart';
import './shopping_card_controller.dart';

class ShoppingCardBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderRepository>(
        () => OrderRepositoryImplementation(restClient: Get.find()));
    Get.put(ShoppingCardController(
      authService: Get.find(),
      shoppingCardService: Get.find(),
      orderRepository: Get.find(),
    ));
  }
}
