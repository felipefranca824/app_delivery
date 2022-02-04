import 'package:app_delivery/app/models/product_model.dart';

class ShoppingCardModel {
  int quantity;
  ProductModel productModel;

  ShoppingCardModel({
    required this.quantity,
    required this.productModel,
  });
}
