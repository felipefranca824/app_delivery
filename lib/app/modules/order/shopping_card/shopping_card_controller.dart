import 'package:app_delivery/app/models/order.dart';
import 'package:app_delivery/app/modules/home/home_controller.dart';
import 'package:app_delivery/app/repositories/order/order_repository.dart';
import 'package:get/get.dart';

import 'package:app_delivery/app/core/services/auth_services.dart';
import 'package:app_delivery/app/core/services/shopping_card_service.dart';
import 'package:app_delivery/app/models/shopping_card_model.dart';

class ShoppingCardController extends GetxController {
  final AuthServices _authService;
  final ShoppingCardService _shoppingCardService;
  final OrderRepository _orderRepository;

  ShoppingCardController({
    required AuthServices authService,
    required ShoppingCardService shoppingCardService,
    required OrderRepository orderRepository,
  })  : _authService = authService,
        _shoppingCardService = shoppingCardService,
        _orderRepository = orderRepository;

  final _address = ''.obs;
  final _cpf = ''.obs;

  set address(String address) => _address.value = address;

  set cpf(String cpf) => _cpf.value = cpf;

  List<ShoppingCardModel> get products => _shoppingCardService.products;
  double get totalValue => _shoppingCardService.totalValue;

  void addQuantityInProduct(ShoppingCardModel shoppingCardModel) {
    _shoppingCardService.addAndRemoveProductInShoppingCard(
      shoppingCardModel.productModel,
      quantity: shoppingCardModel.quantity + 1,
    );
  }

  void subtractQuantityInProduct(ShoppingCardModel shoppingCardModel) {
    _shoppingCardService.addAndRemoveProductInShoppingCard(
      shoppingCardModel.productModel,
      quantity: shoppingCardModel.quantity - 1,
    );
  }

  void clear() => _shoppingCardService.clear();

  Future<void> createOrder() async {
    final userId = _authService.getUserId();
    final order = Order(
      userId: userId!,
      cpf: _cpf.value,
      address: _address.value,
      items: products,
    );

    final orderPix = await _orderRepository.createOrder(order);

    orderPix.copyWith(totalValue: totalValue);

    Get.offNamed('/orders/finished', arguments: orderPix);
    Get.back(id: HomeController.NAVIGATOR_KEY);
  }
}
