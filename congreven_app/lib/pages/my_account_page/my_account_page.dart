import 'package:congreven_app/components/text_field.dart';
import 'package:congreven_app/models/user.dart';
import 'package:congreven_app/pages/my_account_page/my_account_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MyAccountPage extends StatefulWidget {
  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  final cpfController = MaskedTextController(mask: '000.000.000-00');
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  void initState() {
    super.initState();
    final userModel = Provider.of<User>(context, listen: false);
    final myAccountPageController =
        Provider.of<MyAccountPageController>(context, listen: false);
    cpfController.text = userModel.cpf;
    nameController.text = userModel.name;
    emailController.text = userModel.email;
    myAccountPageController.changeName(userModel.name);
  }

  // void dispose() {
  //   super.dispose();
  //           cpfController.text = "";
  //   nameController.text = "";
  //   emailController.text = "";
  // }

  @override
  Widget build(BuildContext context) {
    final myAccountPageController =
        Provider.of<MyAccountPageController>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children: <Widget>[
          Observer(
            builder: (_) {
              return renderTextField(
                labelText: "Nome",
                controller: nameController,
                onChanged: myAccountPageController.changeName,
                errorText: myAccountPageController.validateName,
              );
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
                enabled: false,
              );
            },
          ),
          SizedBox(
            height: 15.0,
          ),
          Observer(
            builder: (_) {
              return renderTextField(
                labelText: "Email",
                controller: emailController,
                enabled: false,
              );
            },
          ),
        ],
      ),
    );
  }
}
