import 'package:congreven_app/config.dart';
import 'package:congreven_app/interfaces/local_storage_interface.dart';
import 'package:congreven_app/models/user.dart';
import 'package:congreven_app/pages/enter_page/enter_page_controller.dart';
import 'package:congreven_app/pages/home_page/home_page.dart';
import 'package:congreven_app/pages/login_page/login_page_controller.dart';
import 'package:congreven_app/services/shared_local_storage_service.dart';
import 'package:congreven_app/utils/delay.dart';
import 'package:congreven_app/utils/routeTo.dart';
import 'package:congreven_app/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert' as convert;

verifyIsLogged(userData, BuildContext context) {
  final userModel = Provider.of<User>(context, listen: false);
  final enterPageController =
      Provider.of<EnterPageController>(context, listen: false);
  Duration duration = Duration(milliseconds: 2500);
  if (userData != null) {
    final userDataDecoded = convert.jsonDecode(userData);
    userModel.loggedUser(userDataDecoded);
    delayThings(
        duration: duration,
        func: () {
          routeTo(context, HomePage());
        });
  }
  delayThings(
      duration: duration,
      func: () {
        enterPageController.changeIsLoadingApp(false);
      });
}

// setNewLoadingAppStatus(bool status, BuildContext context) {
//   final enterPageController = Provider.of<EnterPageController>(context, listen: false);
//   enterPageController.changeIsLoadingApp(true);
// }

loginUser(context) async {
  print("caiu no login!!!");
  final ILocalStorage storage = SharedLocalStorageService();
  final loginPageController =
      Provider.of<LoginPageController>(context, listen: false);
  final enterPageController =
      Provider.of<EnterPageController>(context, listen: false);
  final userModel = Provider.of<User>(context, listen: false);
  final user = loginPageController.userToLogin;
  print("SERVER -> ${Config.server_url}:${Config.server_port}/api/user/login");
  print("user -> $user");
  print("enterPageController -> $enterPageController");
  final response = await http.post(
      "${Config.server_url}:${Config.server_port}/user/login",
      body: user,
      headers: {"Accept": "application/json"});
  print("response status -> ${response.statusCode}");
  if (response.statusCode == 401) {
    toast(
      title: "Erro",
      message: "Email ou senha inválidos.",
      context: context,
    );
  } else if (response.statusCode == 200) {
    final data = convert.jsonDecode(response.body);
    print("DATA -> $data");
    final token = data["token"];
    final user = data["user"];
    final userData = convert.jsonEncode({"token": token, "user": user});
    storage.put("userData", userData);
    userModel.loggedUser(userData);
    toast(
      title: "Sucesso!",
      message: "Usuário logado com sucesso!",
      duration: Duration(milliseconds: 1500),
      context: context,
    );
    routeTo(context, HomePage());
  } else {
    toast(
      title: "Erro",
      message:
          "Ocorreu um erro inesperado. Por favor, reinicie a aplicação e tente novamente.",
      duration: Duration(milliseconds: 2000),
      context: context,
    );
  }
  enterPageController.changeIsLoadingEnterButton(false);
}
