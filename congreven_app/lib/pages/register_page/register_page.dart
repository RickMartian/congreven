import 'package:congreven_app/components/text_field.dart';
import 'package:congreven_app/pages/register_page/register_page_controller.dart';
import 'package:congreven_app/utils/enter_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  final cpfController = MaskedTextController(mask: '000.000.000-00');
  @override
  Widget build(BuildContext context) {
    final registerPageController = Provider.of<RegisterPageController>(context);
    cpfController.text = registerPageController.cpf;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              constraints: BoxConstraints.expand(),
              child: renderEnterTitle(
                firstLine: "Bem vindo ao Congreven!\n",
                secondLine: "Faça o seu cadastro para utilizar o aplicativo.",
                firstLineSize: 26.0,
                secondLineSize: 16.0,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              // color: Colors.yellow,
              child: ListView(
                children: <Widget>[
                  Observer(
                    builder: (_) {
                      return renderTextField(
                          labelText: "Nome",
                          errorText: registerPageController.validateName,
                          onChanged: registerPageController.changeName);
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Observer(
                    builder: (_) {
                      return renderTextField(
                          labelText: "Cpf",
                          controller: cpfController,
                          errorText: registerPageController.validateCpf,
                          onChanged: registerPageController.changeCpf);
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Observer(
                    builder: (_) {
                      return renderTextField(
                          labelText: "Email",
                          errorText: registerPageController.validateEmail,
                          onChanged: registerPageController.changeEmail);
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Observer(
                    builder: (_) {
                      return renderTextField(
                          labelText: "Senha",
                          errorText: registerPageController.validatePassword,
                          isSecret: true,
                          onChanged: registerPageController.changePassword);
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Observer(
                    builder: (_) {
                      return renderTextField(
                          labelText: "Confirmar senha",
                          errorText:
                              registerPageController.validateConfirmPassword,
                          isSecret: true,
                          onChanged:
                              registerPageController.changeConfirmPassword);
                    },
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
