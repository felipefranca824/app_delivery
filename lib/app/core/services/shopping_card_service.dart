import 'package:app_delivery/app/models/product_model.dart';
import 'package:app_delivery/app/models/shopping_card_model.dart';
import 'package:get/get.dart';

class ShoppingCardService extends GetxService {
  final _shoppingCard = <int, ShoppingCardModel>{}.obs;

  List<ShoppingCardModel> get products => _shoppingCard.values.toList();

  int get totalProducts => _shoppingCard.values.length;

  ShoppingCardModel? getById(int id) => _shoppingCard[id];

  double get totalValue {
    return _shoppingCard.values.fold(0, (totalValue, shoppingCardModel) {
      totalValue +=
          shoppingCardModel.productModel.price * shoppingCardModel.quantity;
      return totalValue;
    });
  }

  void addAndRemoveProductInShoppingCard(
    ProductModel product, {
    required quantity,
  }) {
    if (quantity == 0) {
      _shoppingCard.remove(product.id);
    } else {
      _shoppingCard.update(product.id, (product) {
        product.quantity = quantity;
        return product;
      }, ifAbsent: () {
        return ShoppingCardModel(
          quantity: quantity,
          productModel: product,
        );
      });
    }
  }

  void clear() => _shoppingCard.clear();
}
