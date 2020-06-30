import 'package:congreven_app/models/activities.dart';
import 'package:congreven_app/models/news.dart';
import 'package:congreven_app/pages/my_events_edit_page/my_events_edit_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:congreven_app/models/user.dart';
import 'package:congreven_app/pages/events_page/events_page_controller.dart';
import 'package:provider/provider.dart';
import 'package:congreven_app/config.dart';
import 'package:congreven_app/utils/toast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

cleanAllRelatedToEventDetails(BuildContext context) {
  final newsModel = Provider.of<News>(context, listen: false);
  final activitiesModel = Provider.of<Activities>(context, listen: false);
  final myEventsEditPageController =
      Provider.of<MyEventsEditPageController>(context, listen: false);
  newsModel.clean();
  activitiesModel.clean();
  myEventsEditPageController.changeEventToUse(null);
}

getNewsByEventId(BuildContext context, int eventId) async {
  final userModel = Provider.of<User>(context, listen: false);
  final newsModel = Provider.of<News>(context, listen: false);
  newsModel.changeIsFetchingNews(true);
  try {
    final auth = "Bearer ${userModel.token}";
    final response = await http.get(
      "${Config.server_url}:${Config.server_port}/events/news/$eventId",
      headers: {
        "Accept": "application/json",
        "Authorization": auth,
      },
    );
    if (response.statusCode == 200) {
      final data =
          response.body.isNotEmpty ? convert.jsonDecode(response.body) : null;
      if (data != null) {
        print("data getNewsByEventId -> $data");
        if (data is Map) {
          print("message -> ${data["message"]}");
          newsModel.changeFetchingNewsErrorMessage(
              data["message"] ?? "Não há notícias ainda.");
        } else {
          newsModel.updateNews(data);
        }
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
    newsModel.changeIsFetchingNews(false);
  } catch (error) {
    newsModel.changeIsFetchingNews(false);
    toast(
      title: "Erro",
      message:
          "Erro desconhecido. Por favor, reinicie o aplicativo e tente novamente.",
      duration: Duration(milliseconds: 2000),
      context: context,
    );
  }
}

getActivityByEventId(BuildContext context, int eventId) async {
  final userModel = Provider.of<User>(context, listen: false);
  final activitiesModel = Provider.of<Activities>(context, listen: false);
  activitiesModel.changeIsFetchingActivities(true);

  try {
    final auth = "Bearer ${userModel.token}";
    final response = await http.get(
      "${Config.server_url}:${Config.server_port}/events/activities/$eventId",
      headers: {
        "Accept": "application/json",
        "Authorization": auth,
      },
    );
    if (response.statusCode == 200) {
      final data =
          response.body.isNotEmpty ? convert.jsonDecode(response.body) : null;
      if (data != null) {
        print("data getActivityByEventId -> $data");
        if (data != null) {
          print("data getNewsByEventId -> $data");
          if (data is Map) {
            print("message -> ${data["message"]}");
            activitiesModel.changeFetchingActivitiesErrorMessage(
                data["message"] ?? "Não há atividades ainda.");
          } else {
            activitiesModel.updateActivities(data);
          }
        }
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
    activitiesModel.changeIsFetchingActivities(false);
  } catch (error) {
    activitiesModel.changeIsFetchingActivities(false);

    toast(
      title: "Erro",
      message:
          "Erro desconhecido. Por favor, reinicie o aplicativo e tente novamente.",
      duration: Duration(milliseconds: 2000),
      context: context,
    );
  }
}

getActivityById(BuildContext context, int activityId) async {
  final userModel = Provider.of<User>(context, listen: false);
  final eventsPageController =
      Provider.of<EventsPageController>(context, listen: false);
  // eventsPageController.changeIsFetchingEventById(true);
  // TODO: Colocar loading para quando tiver buscando Atividades pelo id e criar uma variável para isso

  try {
    final auth = "Bearer ${userModel.token}";
    final response = await http.get(
      "${Config.server_url}:${Config.server_port}/activities/$activityId",
      headers: {
        "Accept": "application/json",
        "Authorization": auth,
      },
    );
    if (response.statusCode == 200) {
      final data =
          response.body.isNotEmpty ? convert.jsonDecode(response.body) : null;
      if (data != null) {
        print("data getActivityById -> $data");
        // eventsPageController.changeIsFetchingEventById(false);
        return data;
      }
    } else {
      final respDecoded = convert.jsonDecode(response.body);
      // eventsPageController.changeIsFetchingEventById(false);
      toast(
        title: "Erro",
        message: respDecoded["message"] ?? "Erro desconhecido.",
        duration: Duration(milliseconds: 2000),
        context: context,
      );
    }
  } catch (error) {
    // eventsPageController.changeIsFetchingEventById(false);
    toast(
      title: "Erro",
      message:
          "Erro desconhecido. Por favor, reinicie o aplicativo e tente novamente.",
      duration: Duration(milliseconds: 2000),
      context: context,
    );
  }
}
