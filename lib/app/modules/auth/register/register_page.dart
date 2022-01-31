import 'package:app_delivery/app/core/ui/vakinha_ui.dart';
import 'package:app_delivery/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:app_delivery/app/core/ui/widgets/vakinha_button.dart';
import 'package:app_delivery/app/core/ui/widgets/vakinha_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppBar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastro',
                    style: context.textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColorDark,
                    ),
                  ),
                  Text(
                    'Preencha os campos abaixo para criar o seu cadastro.',
                    style: context.textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const VakinhaTextFormField(label: 'Nome'),
                  const SizedBox(
                    height: 30,
                  ),
                  const VakinhaTextFormField(label: 'E-mail'),
                  const SizedBox(
                    height: 30,
                  ),
                  const VakinhaTextFormField(label: 'Senha'),
                  const SizedBox(
                    height: 30,
                  ),
                  const VakinhaTextFormField(label: 'Confirma senha'),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                      child: VakinhaButton(
                    onPressed: () {},
                    label: 'Cadastrar',
                    width: context.width,
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
