import 'package:congreven_app/interfaces/local_storage_interface.dart';
import 'package:congreven_app/models/user.dart';
import 'package:congreven_app/pages/my_account_page/my_account_page_controller.dart';
import 'package:congreven_app/services/shared_local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:congreven_app/config.dart';
import 'package:congreven_app/utils/toast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

verifyIsValidToUpdateUser(BuildContext context) {
  final myAccountPageController =
      Provider.of<MyAccountPageController>(context, listen: false);
  final userModel = Provider.of<User>(context, listen: false);
  if (myAccountPageController.name != userModel.name &&
      myAccountPageController.isValid) {
    return true;
  } else
    return false;
}

updateUser(BuildContext context) async {
  final myAccountPageController =
      Provider.of<MyAccountPageController>(context, listen: false);
  final userModel = Provider.of<User>(context, listen: false);
  final ILocalStorage storage = SharedLocalStorageService();
  myAccountPageController.changeIsLoadingSomeAction(true);
  try {
    final auth = "Bearer ${userModel.token}";
    final cpf = userModel.cpf;
    final user = myAccountPageController.userToUpdate;
    user["email"] = userModel.email;
    final response = await http.put(
      "${Config.server_url}:${Config.server_port}/users/$cpf",
      body: user,
      headers: {"Accept": "application/json", "Authorization": auth},
    );
    if (response.statusCode == 200) {
      final data =
          response.body.isNotEmpty ? convert.jsonDecode(response.body) : null;
      print("data -> $data");
      if (data != null) {
        String userData =
            convert.jsonEncode({"token": userModel.token, "user": data});
        storage.put("userData", userData);
        userModel.updateUser(data);
        toast(
          title: "Sucesso!",
          message: "Dados alterados com sucesso!",
          duration: Duration(milliseconds: 2000),
          context: context,
        );
      }
    } else {
      final respDecoded = convert.jsonDecode(response.body);
      toast(
        title: "Erro",
        message: respDecoded["message"] ?? "Erro desconhecido.",
        duration: Duration(milliseconds: 2000),
        context: context,
      );
    }
    myAccountPageController.changeIsLoadingSomeAction(false);
  } catch (error) {
    myAccountPageController.changeIsLoadingSomeAction(false);
    toast(
      title: "Erro",
      message:
          "Erro desconhecido. Por favor, reinicie o aplicativo e tente novamente.",
      duration: Duration(milliseconds: 2000),
      context: context,
    );
  }
}
