import 'package:app_delivery/app/models/product_model.dart';

abstract class ProductRepositoryInterface {
  Future<List<ProductModel>> findAll();
}
