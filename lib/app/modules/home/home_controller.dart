import 'package:app_delivery/app/modules/order/shopping_card/shopping_card_bindings.dart';
import 'package:app_delivery/app/modules/order/shopping_card/shopping_card_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app_delivery/app/core/services/auth_services.dart';
import 'package:app_delivery/app/core/services/shopping_card_service.dart';
import 'package:app_delivery/app/modules/menu/menu_bindings.dart';
import 'package:app_delivery/app/modules/menu/menu_page.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;

  final ShoppingCardService _shoppingCardService;
  HomeController({
    required ShoppingCardService shoppingCardService,
  }) : _shoppingCardService = shoppingCardService;

  final _tabIndex = 0.obs;

  int get totalProdcutsInShoppingCard => _shoppingCardService.totalProducts;

  int get tabIndex => _tabIndex.value;

  final _tabs = [
    '/menu',
    '/order/shopping_card',
    '/exit',
  ];

  set tabIndex(int index) {
    _tabIndex(index);
    if (_tabs[index] == '/exit') {
      Get.find<AuthServices>().logout();
    } else {
      Get.toNamed(_tabs[index], id: NAVIGATOR_KEY);
    }
  }

  Route? onGeneratedRouter(RouteSettings settings) {
    if (settings.name == '/menu') {
      return GetPageRoute(
        settings: settings,
        page: () => const MenuPage(),
        binding: MenuBindings(),
        transition: Transition.fadeIn,
      );
    }
    if (settings.name == '/order/shopping_card') {
      return GetPageRoute(
        settings: settings,
        page: () => const ShoppingCardPage(),
        binding: ShoppingCardBindings(),
        transition: Transition.fadeIn,
      );
    }
  }
}
