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

createSupport(int eventId, String cnpj, String token) async {
  final body = {"event_id": eventId, "cnpj_organizer": cnpj};
  print("body -> $body");
  final response = await http.post(
    "${Config.server_url}:${Config.server_port}/supports",
    body: body,
    headers: {"Accept": "application/json", "Authorization": token},
  );
  return response;
}

createNewEvent(BuildContext context) async {
  final userModel = Provider.of<User>(context, listen: false);
  final newEventFormsPageController =
      Provider.of<NewEventFormsPageController>(context, listen: false);
  newEventFormsPageController.changeIsLoadingSomeAction(true);
  final event = newEventFormsPageController.eventToRegister;
  event["cpf_owner"] = userModel.cpf;
  event["owner_description"] = "";
  try {
    final auth = "Bearer ${userModel.token}";
    print("event -> $event");
    print("token -> $auth");
    print("url -> ${Config.server_url}:${Config.server_port}/events");
    final response = await http.post(
      "${Config.server_url}:${Config.server_port}/events",
      body: event,
      headers: {"Accept": "application/json", "Authorization": auth},
    );
    final data =
        response.body.isNotEmpty ? convert.jsonDecode(response.body) : null;
    print("data -> $data");
    if (response.statusCode == 200) {
      if (!newEventFormsPageController.isOwner) {
        final organizers = newEventFormsPageController.selectedOrganizers;
        for (var value in organizers) {
          print("value -> $value");
          // TODO: pegar id do evento pela resposta e linkar!
          await createSupport(data["id"], value["cnpj"], auth).then((resp) {
            if (resp != null) {
              print("code -> ${resp.statusCode}");
              print("resp -> ${resp.body}");
            }
          });
        }
      }
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
    print("error -> $error");
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
