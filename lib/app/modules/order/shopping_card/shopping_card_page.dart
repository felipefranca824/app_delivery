import 'package:app_delivery/app/core/ui/formatter_helper.dart';
import 'package:app_delivery/app/core/ui/widgets/plus_minus_box.dart';
import 'package:app_delivery/app/core/ui/widgets/vakinha_button.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import './shopping_card_controller.dart';

class ShoppingCardPage extends GetView<ShoppingCardController> {
  final formKey = GlobalKey<FormState>();
  ShoppingCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (_, constrains) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constrains.maxHeight,
              minWidth: constrains.maxWidth,
            ),
            child: IntrinsicHeight(
              child: Form(
                key: formKey,
                child: Visibility(
                  visible: controller.products.isNotEmpty,
                  replacement: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Carrinho',
                          style: context.textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.theme.primaryColorDark,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Nenhum item adicionado no carrinho')
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Text(
                              'Carrinho',
                              style: context.textTheme.headline6?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: context.theme.primaryColorDark,
                              ),
                            ),
                            IconButton(
                                onPressed: controller.clear,
                                icon: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                      ),
                      Obx(() {
                        return Column(
                          children: controller.products
                              .map((product) => Container(
                                    margin: const EdgeInsets.all(10),
                                    child: PlusMinusBox(
                                      label: product.productModel.name,
                                      calculateTotal: true,
                                      elevated: true,
                                      backgroundColor: Colors.white,
                                      quantity: product.quantity,
                                      price: product.productModel.price,
                                      minusCallback: () {
                                        controller
                                            .subtractQuantityInProduct(product);
                                      },
                                      plusCallback: () {
                                        controller
                                            .addQuantityInProduct(product);
                                      },
                                    ),
                                  ))
                              .toList(),
                        );
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total do pedido',
                              style: context.textTheme.bodyText1?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Obx(() {
                              return Text(
                                FormatterHelper.formatCurrency(
                                    controller.totalValue),
                                style: context.textTheme.bodyText1?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            })
                          ],
                        ),
                      ),
                      const Divider(),
                      const _AddressField(),
                      const Divider(),
                      const _CpfField(),
                      const Divider(),
                      const Spacer(),
                      Center(
                        child: SizedBox(
                          width: context.widthTransformer(reducedBy: 10),
                          child: VakinhaButton(
                            label: 'FINALIZAR',
                            onPressed: () {
                              final formValid =
                                  formKey.currentState?.validate() ?? false;

                              if (formValid) {
                                controller.createOrder();
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _AddressField extends GetView<ShoppingCardController> {
  const _AddressField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
            child: Expanded(
              child: Text(
                'Endere??o de entrega',
                style: TextStyle(
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              controller.address = value;
            },
            validator: Validatorless.required('Endere??o obrigat??rio'),
            decoration: const InputDecoration(
                hintText: 'Digite o endere??o',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class _CpfField extends GetView<ShoppingCardController> {
  const _CpfField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
            child: Expanded(
              child: Text(
                'CPF',
                style: TextStyle(
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              controller.cpf = value;
            },
            validator: Validatorless.multiple([
              Validatorless.required('CPF obrigat??rio'),
              Validatorless.cpf('Cpf invalido'),
            ]),
            decoration: const InputDecoration(
                hintText: 'Digite o cpf',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
