import 'package:congreven_app/models/organizer.dart';
import 'package:congreven_app/models/user.dart';
import 'package:congreven_app/pages/new_event_forms_page/new_event_forms_page_controller.dart';
import 'package:congreven_app/pages/organizer_page/organizer_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:congreven_app/config.dart';
import 'package:congreven_app/utils/toast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

selectOrganizer(BuildContext context, dynamic organizer) {
  print("ORGANIZER TO LINK TO EVENT! -> $organizer");
  final newEventFormsPageController =
      Provider.of<NewEventFormsPageController>(context, listen: false);
  newEventFormsPageController.addOrganizerToEvent(organizer);
}

removeSelectedOrganizer(BuildContext context, dynamic organizer) {
  print("remove organizzer !! -> $organizer");
  final newEventFormsPageController =
      Provider.of<NewEventFormsPageController>(context, listen: false);
  newEventFormsPageController.removeOrganizerFromEvent(organizer);
}

fetchOrganizers(BuildContext context) async {
  final organizerModel = Provider.of<Organizer>(context, listen: false);
  final userModel = Provider.of<User>(context, listen: false);
  final organizerPageController =
      Provider.of<OrganizerPageController>(context, listen: false);
  organizerPageController.changeIsFetchingOrganizer(true);
  try {
    final auth = "Bearer ${userModel.token}";
    final response = await http.get(
      "${Config.server_url}:${Config.server_port}/organizers",
      headers: {"Accept": "application/json", "Authorization": auth},
    );
    if (response.statusCode == 200) {
      final data =
          response.body.isNotEmpty ? convert.jsonDecode(response.body) : null;
      if (data != null) {
        organizerModel.updateOrganizers(data);
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
    organizerPageController.changeIsFetchingOrganizer(false);
  } catch (error) {
    organizerPageController.changeIsFetchingOrganizer(false);
    toast(
      title: "Erro",
      message:
          "Erro desconhecido. Por favor, reinicie o aplicativo e tente novamente.",
      duration: Duration(milliseconds: 2000),
      context: context,
    );
  }
}
