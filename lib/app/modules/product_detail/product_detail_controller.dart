import 'package:get/get.dart';

import 'package:app_delivery/app/core/services/shopping_card_service.dart';
import 'package:app_delivery/app/models/product_model.dart';

class ProductDetailController extends GetxController {
  final _product = Rx<ProductModel>(Get.arguments);
  final _totalPrice = 0.00.obs;
  final _quantity = 1.obs;
  final _alreadyAdded = false.obs;
  final ShoppingCardService _shoppingCardService;

  ProductDetailController({
    required ShoppingCardService shoppingCardService,
  }) : _shoppingCardService = shoppingCardService;

  ProductModel get product => _product.value;

  double get totalPrice => _totalPrice.value;

  int get quantity => _quantity.value;
  bool get alreadyAdded => _alreadyAdded.value;

  @override
  void onInit() {
    super.onInit();
    _totalPrice(_product.value.price);
    ever<int>(_quantity, (quantity) {
      _totalPrice(_product.value.price * quantity);
    });

    final productShoppingCard = _shoppingCardService.getById(product.id);

    if (productShoppingCard != null) {
      _quantity(productShoppingCard.quantity);
      _alreadyAdded(true);
    }
  }

  void addProduct() {
    _quantity.value++;
  }

  void removeProduct() {
    if (_quantity > 1) {
      _quantity.value--;
    }
  }

  void addProductInShoppingCard() {
    _shoppingCardService.addAndRemoveProductInShoppingCard(
      product,
      quantity: quantity,
    );
    Get.back();
  }
}
