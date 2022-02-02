import 'dart:developer';

import 'package:app_delivery/app/core/mixins/loader_mixin.dart';
import 'package:app_delivery/app/core/mixins/messages_mixin.dart';
import 'package:app_delivery/app/models/product_model.dart';
import 'package:app_delivery/app/repositories/product/product_repository_interface.dart';
import 'package:get/get.dart';

import 'package:app_delivery/app/repositories/product/product_repository.dart';

class MenuController extends GetxController with LoaderMixin, MessagesMixin {
  final ProductRepositoryInterface _productRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  final menu = <ProductModel>[].obs;

  MenuController({
    required ProductRepositoryInterface productRepository,
  }) : _productRepository = productRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      _loading.toggle();
      await findAllProducts();
      _loading.toggle();
    } catch (e, s) {
      _loading.toggle();
      log('erro ao buscar menu', error: e, stackTrace: s);
      _message(MessageModel(
          title: 'Erro',
          message: 'Erro ao buscar menu',
          type: MessageType.error));
    }
  }

  Future<void> findAllProducts() async {
    final products = await _productRepository.findAll();
    menu.assignAll(products);
  }

  Future<void> refreshPage() async {
    try {
      await findAllProducts();
    } catch (e, s) {
      log('erro ao buscar menu', error: e, stackTrace: s);
      _message(MessageModel(
          title: 'Erro',
          message: 'Erro ao buscar menu',
          type: MessageType.error));
    }
  }
}
