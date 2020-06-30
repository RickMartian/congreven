import 'package:congreven_app/actions/events_details_page_actions.dart';
import 'package:congreven_app/models/user.dart';
import 'package:congreven_app/pages/new_activity_forms_page/new_activity_forms_page_controller.dart';
import 'package:congreven_app/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../config.dart';

cleanNewActivityState(BuildContext context) async {
  final newActivityFormsPageController =
      Provider.of<NewActivityFormsPageController>(context, listen: false);
  newActivityFormsPageController.clean();
  newActivityFormsPageController.changeIsLoadingSomeAction(false);
}

createNewActivity(BuildContext context, int eventId) async {
  final userModel = Provider.of<User>(context, listen: false);
  final newActivityFormsPageController =
      Provider.of<NewActivityFormsPageController>(context, listen: false);
  newActivityFormsPageController.changeIsLoadingSomeAction(true);
  final activity = newActivityFormsPageController.activityToRegister;
  try {
    final auth = "Bearer ${userModel.token}";
    print("event id -> $eventId");
    activity["event_id"] = eventId.toString();
    print("activity -> $activity");
    print("token -> $auth");
    print("url -> ${Config.server_url}:${Config.server_port}/activity");
    print("json encoded -> ${convert.jsonEncode(activity)}");
    final response = await http.post(
      "${Config.server_url}:${Config.server_port}/activities",
      body: convert.jsonEncode(activity),
      headers: {
        "Accept": "application/json",
        "Authorization": auth,
        "Content-Type": "application/json"
      },
    );
    final data =
        response.body.isNotEmpty ? convert.jsonDecode(response.body) : null;
    print("data -> $data");
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
      cleanNewActivityState(context);
      getActivityByEventId(context, eventId);
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
    newActivityFormsPageController.changeIsLoadingSomeAction(false);
  } catch (error) {
    print("error -> $error");
    newActivityFormsPageController.changeIsLoadingSomeAction(false);
    toast(
      title: "Erro",
      message:
          "Erro desconhecido. Por favor, reinicie o aplicativo e tente novamente.",
      duration: Duration(milliseconds: 2000),
      context: context,
    );
  }
}
