import 'package:congreven_app/actions/events_page_actions.dart';
import 'package:congreven_app/models/user.dart';
import 'package:congreven_app/pages/new_event_forms_page/new_event_forms_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:congreven_app/config.dart';
import 'package:congreven_app/utils/toast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

cleanNewEventState(BuildContext context) {
  final newEventFormsPageController =
      Provider.of<NewEventFormsPageController>(context, listen: false);
  newEventFormsPageController.clean();
  newEventFormsPageController.changeIsLoadingSomeAction(false);
  newEventFormsPageController.changeIsOwner(true);
}

createNewEvent(BuildContext context) async {
  final userModel = Provider.of<User>(context, listen: false);
  final newEventFormsPageController =
      Provider.of<NewEventFormsPageController>(context, listen: false);
  newEventFormsPageController.changeIsLoadingSomeAction(true);
  final event = newEventFormsPageController.eventToRegister;
  event["cpf_owner"] = userModel.cpf;
  try {
    final auth = "Bearer ${userModel.token}";
    final response = await http.post(
      "${Config.server_url}:${Config.server_port}/events",
      body: event,
      headers: {"Accept": "application/json", "Authorization": auth},
    );
    final data =
        response.body.isNotEmpty ? convert.jsonDecode(response.body) : null;
    if (response.statusCode == 200) {
      Navigator.pop(context);
      if (data != null) {
        toast(
          title: "Sucesso!",
          message: data["message"] ?? "Evento criado com sucesso!",
          duration: Duration(milliseconds: 2000),
          context: context,
        );
      }
      cleanNewEventState(context);
      fetchEvents(context);
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
    newEventFormsPageController.changeIsLoadingSomeAction(false);
  } catch (error) {
    newEventFormsPageController.changeIsLoadingSomeAction(false);
    toast(
      title: "Erro",
      message:
          "Erro desconhecido. Por favor, reinicie o aplicativo e tente novamente.",
      duration: Duration(milliseconds: 2000),
      context: context,
    );
  }
}
