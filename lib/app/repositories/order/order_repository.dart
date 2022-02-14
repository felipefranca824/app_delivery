import 'package:app_delivery/app/models/order.dart';
import 'package:app_delivery/app/models/order_pix.dart';

abstract class OrderRepository {
  Future<OrderPix> createOrder(Order order);
}
