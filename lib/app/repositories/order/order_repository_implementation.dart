import 'dart:developer';

import 'package:app_delivery/app/core/rest_client/rest_client.dart';
import 'package:app_delivery/app/models/order.dart';
import 'package:app_delivery/app/models/order_pix.dart';
import 'package:app_delivery/app/repositories/order/order_repository.dart';

class OrderRepositoryImplementation implements OrderRepository {
  final RestClient _restClient;
  OrderRepositoryImplementation({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<OrderPix> createOrder(Order order) async {
    final result = await _restClient.post('/order/', {
      'userId': order.userId,
      'cpf': order.cpf,
      'address': order.address,
      'items': order.items
          .map((shoppingCard) => {
                'quantity': shoppingCard.quantity,
                'productId': shoppingCard.productModel.id,
              })
          .toList(),
    });

    if (result.hasError) {
      log(
        "Erro ao realizar pedido ${result.statusCode}",
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException(message: 'Erro ao realizar pedido');
    }

    return OrderPix.fromMap(result.body);
  }
}
