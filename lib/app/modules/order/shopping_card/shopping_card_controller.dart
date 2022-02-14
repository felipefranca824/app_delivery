import 'package:get/get.dart';

import 'package:app_delivery/app/core/services/auth_services.dart';
import 'package:app_delivery/app/core/services/shopping_card_service.dart';
import 'package:app_delivery/app/models/shopping_card_model.dart';

class ShoppingCardController extends GetxController {
  final AuthServices _authService;
  final ShoppingCardService _shoppingCardService;

  ShoppingCardController({
    required AuthServices authService,
    required ShoppingCardService shoppingCardService,
  })  : _authService = authService,
        _shoppingCardService = shoppingCardService;

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
}
