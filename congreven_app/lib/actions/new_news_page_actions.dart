import 'package:congreven_app/actions/events_details_page_actions.dart';
import 'package:congreven_app/models/user.dart';
import 'package:congreven_app/pages/new_news_forms_page/new_news_forms_page_controller.dart';
import 'package:congreven_app/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../config.dart';

cleanNewNewsState(BuildContext context) async {
  final newNewsFormsPageController =
      Provider.of<NewNewsFormsPageController>(context, listen: false);
  newNewsFormsPageController.clean();
  newNewsFormsPageController.changeIsLoadingSomeAction(false);
}

createNewNews(BuildContext context, int eventId) async {
  final userModel = Provider.of<User>(context, listen: false);
  final newNewsFormsPageController =
      Provider.of<NewNewsFormsPageController>(context, listen: false);
  newNewsFormsPageController.changeIsLoadingSomeAction(true);
  final news = newNewsFormsPageController.newsToRegister;
  news["event_id"] = eventId.toString();
  try {
    final auth = "Bearer ${userModel.token}";
    final response = await http.post(
      "${Config.server_url}:${Config.server_port}/news",
      body: convert.jsonEncode(news),
      headers: {
        "Accept": "application/json",
        "Authorization": auth,
        "Content-Type": "application/json"
      },
    );
    final data =
        response.body.isNotEmpty ? convert.jsonDecode(response.body) : null;
    if (response.statusCode == 200) {
      Navigator.pop(context);
      if (data != null) {
        toast(
          title: "Sucesso!",
          message: data["message"] ?? "Notícia criada com sucesso!",
          duration: Duration(milliseconds: 2000),
          context: context,
        );
      }
      cleanNewNewsState(context);
      getNewsByEventId(context, eventId);
    } else if (response.statusCode == 400) {
      toast(
        title: "Erro",
        message: data["message"] ?? "Erro desconhecido.",
        duration: Duration(milliseconds: 2000),
        context: context,
      );
    } else {
      toast(
        title: "Erro",
        message: data["message"] ?? "Erro desconhecido.",
        duration: Duration(milliseconds: 2000),
        context: context,
      );
    }
    newNewsFormsPageController.changeIsLoadingSomeAction(false);
  } catch (error) {
    newNewsFormsPageController.changeIsLoadingSomeAction(false);
    toast(
      title: "Erro",
      message:
          "Erro desconhecido. Por favor, reinicie o aplicativo e tente novamente.",
      duration: Duration(milliseconds: 2000),
      context: context,
    );
  }
}
