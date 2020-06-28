import 'package:congreven_app/actions/events_page_actions.dart';
import 'package:congreven_app/actions/organizer_page_actions.dart';
import 'package:congreven_app/models/user.dart';
import 'package:congreven_app/pages/new_organizer_forms_page/new_organizer_forms_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:congreven_app/config.dart';
import 'package:congreven_app/utils/toast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

cleanNewOrganizerState(BuildContext context) {
  final newOrganizerFormsPageController =
      Provider.of<NewOrganizerFormsPageController>(context, listen: false);
  newOrganizerFormsPageController.clean();
  newOrganizerFormsPageController.changeIsLoadingSomeAction(false);
}

createNewOrganizer(BuildContext context) async {
  final userModel = Provider.of<User>(context, listen: false);
  final newOrganizerFormsPageController =
      Provider.of<NewOrganizerFormsPageController>(context, listen: false);
  newOrganizerFormsPageController.changeIsLoadingSomeAction(true);
  final organizer = newOrganizerFormsPageController.organizerToRegister;
  try {
    final auth = "Bearer ${userModel.token}";
    final response = await http.post(
      "${Config.server_url}:${Config.server_port}/organizers",
      body: organizer,
      headers: {"Accept": "application/json", "Authorization": auth},
    );
    final data =
        response.body.isNotEmpty ? convert.jsonDecode(response.body) : null;
    if (response.statusCode == 200) {
      Navigator.pop(context);
      if (data != null) {
        toast(
          title: "Sucesso!",
          message: data["message"] ?? "Organizador criado com sucesso!",
          duration: Duration(milliseconds: 2000),
          context: context,
        );
      }
      cleanNewOrganizerState(context);
      fetchOrganizers(context);
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
    newOrganizerFormsPageController.changeIsLoadingSomeAction(false);
  } catch (error) {
    newOrganizerFormsPageController.changeIsLoadingSomeAction(false);
    toast(
      title: "Erro",
      message:
          "Erro desconhecido. Por favor, reinicie o aplicativo e tente novamente.",
      duration: Duration(milliseconds: 2000),
      context: context,
    );
  }
}