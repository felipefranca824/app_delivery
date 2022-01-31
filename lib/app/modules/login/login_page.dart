import 'package:app_delivery/app/core/ui/vakinha_ui.dart';
import 'package:app_delivery/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:app_delivery/app/core/ui/widgets/vakinha_button.dart';
import 'package:app_delivery/app/core/ui/widgets/vakinha_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppBar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: context.textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.theme.primaryColorDark,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const VakinhaTextFormField(label: 'E-mail'),
                      const SizedBox(
                        height: 30,
                      ),
                      const VakinhaTextFormField(label: 'Senha'),
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                          child: VakinhaButton(
                        onPressed: () {},
                        label: 'ENTRAR',
                        width: context.width,
                      )),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Não possui uma conta?'),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Cadastre-se',
                                style: VakinhaUI.textBold,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
