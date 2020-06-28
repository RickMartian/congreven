import 'package:congreven_app/interfaces/local_storage_interface.dart';
import 'package:congreven_app/models/user.dart';
import 'package:congreven_app/pages/enter_page/enter_page.dart';
import 'package:congreven_app/pages/enter_page/enter_page_controller.dart';
import 'package:congreven_app/pages/home_page/home_page_controller.dart';
import 'package:congreven_app/services/shared_local_storage_service.dart';
import 'package:congreven_app/utils/delay.dart';
import 'package:congreven_app/utils/routeTo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:congreven_app/config.dart';
import 'package:congreven_app/utils/toast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

changeIsLoadingApp(BuildContext context, bool status) {
  final enterPageController =
      Provider.of<EnterPageController>(context, listen: false);
  delayThings(func: () {
    enterPageController.changeIsLoadingApp(false);
  });
}

logoutUser({String token, BuildContext context}) async {
  final userModel = Provider.of<User>(context, listen: false);
  final homePageController =
      Provider.of<HomePageController>(context, listen: false);
  final ILocalStorage storage = SharedLocalStorageService();
  try {
    final response = await http.get(
      "${Config.server_url}:${Config.server_port}/user/logout",
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );
    // final data =
    //     response.body.isNotEmpty ? convert.jsonDecode(response.body) : null;
    // print("data -> $data");
    if (response.statusCode == 401) {
      toast(
        title: "Erro",
        message:
            "Ocorreu um erro ao sair. Por favor, reinicie o aplicativo e tente novamente.",
        duration: Duration(milliseconds: 2000),
        context: context,
      );
    } else {
      userModel.clean();
      storage.delete("userData");
      routeTo(context, EnterPage());
    }
    homePageController.changeIsLoadingLogout(false);
  } catch (error) {
    homePageController.changeIsLoadingLogout(false);
    toast(
      title: "Erro",
      message:
          "Ocorreu um erro inesperado. Por favor, reinicie o aplicativo e tente novamente.",
      duration: Duration(milliseconds: 2000),
      context: context,
    );
  }
}
