import 'package:congreven_app/models/events.dart';
import 'package:congreven_app/models/user.dart';
import 'package:congreven_app/pages/events_page/events_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:congreven_app/config.dart';
import 'package:congreven_app/utils/toast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

getEventById(BuildContext context, int id) async {
  final userModel = Provider.of<User>(context, listen: false);
  final eventsPageController =
      Provider.of<EventsPageController>(context, listen: false);
  eventsPageController.changeIsFetchingEventById(true);
  try {
    final auth = "Bearer ${userModel.token}";
    final response = await http.get(
      "${Config.server_url}:${Config.server_port}/events/$id",
      headers: {"Accept": "application/json", "Authorization": auth},
    );
    if (response.statusCode == 200) {
      final data =
          response.body.isNotEmpty ? convert.jsonDecode(response.body) : null;
      if (data != null) {
        eventsPageController.changeIsFetchingEventById(false);
        return data;
      }
    } else {
      final respDecoded = convert.jsonDecode(response.body);
      eventsPageController.changeIsFetchingEventById(false);
      toast(
        title: "Erro",
        message: respDecoded["message"] ?? "Erro desconhecido.",
        duration: Duration(milliseconds: 2000),
        context: context,
      );
    }
  } catch (error) {
    eventsPageController.changeIsFetchingEventById(false);
    toast(
      title: "Erro",
      message:
          "Erro desconhecido. Por favor, reinicie o aplicativo e tente novamente.",
      duration: Duration(milliseconds: 2000),
      context: context,
    );
  }
}

fetchEvents(BuildContext context) async {
  final eventsModel = Provider.of<Events>(context, listen: false);
  final userModel = Provider.of<User>(context, listen: false);
  final eventsPageController =
      Provider.of<EventsPageController>(context, listen: false);
  eventsPageController.changeIsFetchingEvents(true);
  try {
    final auth = "Bearer ${userModel.token}";
    final response = await http.get(
      "${Config.server_url}:${Config.server_port}/events",
      headers: {"Accept": "application/json", "Authorization": auth},
    );
    if (response.statusCode == 200) {
      final data =
          response.body.isNotEmpty ? convert.jsonDecode(response.body) : null;
      if (data != null) {
        eventsModel.updateEvents(data);
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
    eventsPageController.changeIsFetchingEvents(false);
  } catch (error) {
    eventsPageController.changeIsFetchingEvents(false);
    toast(
      title: "Erro",
      message:
          "Erro desconhecido. Por favor, reinicie o aplicativo e tente novamente.",
      duration: Duration(milliseconds: 2000),
      context: context,
    );
  }
}
