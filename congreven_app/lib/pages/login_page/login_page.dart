import 'package:congreven_app/components/text_field.dart';
import 'package:congreven_app/pages/login_page/login_page_controller.dart';
import 'package:congreven_app/utils/enter_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginPageController = Provider.of<LoginPageController>(context);
    return Container(
      child: Center(
          child: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              constraints: BoxConstraints.expand(),
              child: renderEnterTitle(
                firstLine: "Bem vindo ao Congreven!\n",
                secondLine: "Faça login para utilizar o aplicativo.",
                firstLineSize: 26.0,
                secondLineSize: 16.0,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              // color: Colors.yellow,
              child: Column(
                children: <Widget>[
                  Observer(
                    builder: (_) {
                      return renderTextField(
                        labelText: "Email",
                        errorText: loginPageController.validateEmail,
                        onChanged: loginPageController.changeEmail,
                      );
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Flexible(
                    child: Observer(
                      builder: (_) {
                        return renderTextField(
                          labelText: "Senha",
                          errorText: loginPageController.validatePassword,
                          isSecret: true,
                          onChanged: loginPageController.changePassword,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
