import 'package:app_delivery/app/modules/order/finished/finished_page.dart';
import 'package:app_delivery/app/modules/order/pix/pix_page.dart';
import 'package:get/get.dart';

class OrdersRouters {
  OrdersRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/orders/finished/',
      page: () => FinishedPage(),
    ),
    GetPage(
      name: '/orders/pix',
      page: () => PixPage(),
    )
  ];
}
