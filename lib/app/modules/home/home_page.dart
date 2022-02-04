import 'package:app_delivery/app/core/services/auth_services.dart';
import 'package:app_delivery/app/core/ui/widgets/icon_badge.dart';
import 'package:app_delivery/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppBar(
        elevation: 0,
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          onTap: (value) => controller.tabIndex = value,
          currentIndex: controller.tabIndex,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Produtos',
            ),
            BottomNavigationBarItem(
              icon: IconBadge(
                number: controller.totalProdcutsInShoppingCard,
                icon: Icons.shopping_cart,
              ),
              label: 'Carrinho',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app),
              label: 'Sair',
            )
          ],
        );
      }),
      body: Navigator(
        initialRoute: '/menu',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: controller.onGeneratedRouter,
      ),
    );
  }
}
