import 'package:congreven_app/models/events.dart';
import 'package:congreven_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:congreven_app/config.dart';
import 'package:congreven_app/utils/toast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

fetchEvents(BuildContext context) async {
  final eventsModel = Provider.of<Events>(context, listen: false);
  final userModel = Provider.of<User>(context, listen: false);
  try {
    final auth = "Bearer ${userModel.token}";
    final response = await http.get(
      "${Config.server_url}:${Config.server_port}/events",
      headers: {"Accept": "application/json", "Authorization": auth},
    );
    print("response statusCode -> ${response.statusCode}");
    print("response body -> ${response.body}");
    if (response.statusCode == 200) {
      final data =
          response.body.isNotEmpty ? convert.jsonDecode(response.body) : null;
      print("data -> $data");
      if (data != null && data.length > 0) {
        toast(
          title: "Sucesso!",
          message: "Eventos buscados com sucesso!",
          duration: Duration(milliseconds: 2000),
          context: context,
        );
      } else {
        toast(
          title: "Informação",
          message: "Não há nenhum evento disponível ainda.",
          duration: Duration(milliseconds: 1800),
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
  } catch (error) {
    toast(
      title: "Erro",
      message:
          "Erro desconhecido. Por favor, reinicie o aplicativo e tente novamente.",
      duration: Duration(milliseconds: 2000),
      context: context,
    );
  }
}
