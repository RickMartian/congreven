import 'package:congreven_app/pages/enter_page/enter_page_controller.dart';
import 'package:congreven_app/pages/register_page/register_page_controller.dart';
import 'package:provider/provider.dart';
import 'package:congreven_app/config.dart';
import 'package:congreven_app/utils/toast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

registerUser(context) async {
  final registerPageController =
      Provider.of<RegisterPageController>(context, listen: false);
  final enterPageController =
      Provider.of<EnterPageController>(context, listen: false);
  final user = registerPageController.userToRegister;
  try {
    final response = await http.post(
        "${Config.server_url}:${Config.server_port}/users",
        body: convert.jsonEncode(user),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        });
    if (response.statusCode == 200) {
      toast(
        title: "Sucesso!",
        message: "Cadastro realizado com sucesso! Por favor, realize o login!",
        duration: Duration(milliseconds: 3000),
        context: context,
      );
    } else {
      final respDecoded = convert.jsonDecode(response.body);
      toast(
        title: "Erro",
        message: respDecoded["message"] ?? "Erro desconhecido.",
        duration: Duration(milliseconds: 2000),
        context: context,
      );
    }
  } catch (error) {
    toast(
      title: "Erro",
      message:
          "Ocorreu um erro inesperado. Por favor, reinicie o aplicativo e tente novamente.",
      duration: Duration(milliseconds: 2000),
      context: context,
    );
  }
  enterPageController.changeIsLoadingEnterButton(false);
}
