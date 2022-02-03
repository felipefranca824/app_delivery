import 'package:app_delivery/app/models/product_model.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  final _product = Rx<ProductModel>(Get.arguments);
  final _totalPrice = 0.00.obs;
  final _quantity = 1.obs;

  ProductModel get product => _product.value;

  double get totalPrice => _totalPrice.value;

  int get quantity => _quantity.value;

  @override
  void onInit() {
    super.onInit();
    _totalPrice(_product.value.price);
    ever<int>(_quantity, (quantity) {
      _totalPrice(_product.value.price * quantity);
    });
  }

  void addProduct() {
    _quantity.value++;
  }

  void removeProduct() {
    if (_quantity > 1) {
      _quantity.value--;
    }
  }
}
