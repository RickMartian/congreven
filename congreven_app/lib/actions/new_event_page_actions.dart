import 'package:congreven_app/actions/events_page_actions.dart';
import 'package:congreven_app/models/user.dart';
import 'package:congreven_app/pages/my_events_edit_page/my_events_edit_page_controller.dart';
import 'package:congreven_app/pages/new_event_forms_page/new_event_forms_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:congreven_app/config.dart';
import 'package:congreven_app/utils/toast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

cleanNewEventState(BuildContext context) {
  final newEventFormsPageController =
      Provider.of<NewEventFormsPageController>(context, listen: false);
  final myEventsEditPageController =
      Provider.of<MyEventsEditPageController>(context, listen: false);
  newEventFormsPageController.clean();
  newEventFormsPageController.changeIsLoadingSomeAction(false);
  newEventFormsPageController.changeIsOwner(true);
  myEventsEditPageController.changeEventToUse(null);
}

createSupport(int eventId, String cnpj, String token) async {
  final body = {"event_id": eventId, "cnpj_organizer": cnpj};
  final response = await http.post(
    "${Config.server_url}:${Config.server_port}/supports",
    body: convert.jsonEncode(body),
    headers: {
      "Accept": "application/json",
      "Authorization": token,
      "Content-Type": "application/json"
    },
  );
  return response;
}

deleteSupport(int eventId, String cnpj, String token) async {
  final response = await http.delete(
    "${Config.server_url}:${Config.server_port}/supports?event_id=$eventId&cnpj_organizer=$cnpj",
    headers: {"Accept": "application/json", "Authorization": token},
  );
  return response;
}

updateEvent(BuildContext context) async {
  final userModel = Provider.of<User>(context, listen: false);
  final newEventFormsPageController =
      Provider.of<NewEventFormsPageController>(context, listen: false);
  final myEventsEditPageController =
      Provider.of<MyEventsEditPageController>(context, listen: false);
  newEventFormsPageController.changeIsLoadingSomeAction(true);
  final event = newEventFormsPageController.eventToRegister;
  event["cpf_owner"] = userModel.cpf;
  if (!newEventFormsPageController.isOwner) {
    event["owner_description"] = "";
  }

  try {
    final auth = "Bearer ${userModel.token}";
    final id = myEventsEditPageController.eventToUse["event"]["id"];
    final response = await http.put(
      "${Config.server_url}:${Config.server_port}/events/$id",
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
          message: "Evento atualizado com sucesso!",
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

createNewEvent(BuildContext context) async {
  final userModel = Provider.of<User>(context, listen: false);
  final newEventFormsPageController =
      Provider.of<NewEventFormsPageController>(context, listen: false);
  newEventFormsPageController.changeIsLoadingSomeAction(true);
  final event = newEventFormsPageController.eventToRegister;
  try {
    final auth = "Bearer ${userModel.token}";
    event["cpf_owner"] = userModel.cpf;
    if (!newEventFormsPageController.isOwner) {
      event["owner_description"] = "";
    }
    if (event["organizers"] == null) {
      event["organizers"] = [];
    }
    final response = await http.post(
      "${Config.server_url}:${Config.server_port}/events",
      body: convert.jsonEncode(event),
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
