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

getEventByCpfUser({BuildContext context, bool needToReturnData = false}) async {
  final eventsModel = Provider.of<Events>(context, listen: false);
  final userModel = Provider.of<User>(context, listen: false);
  final eventsPageController =
      Provider.of<EventsPageController>(context, listen: false);
  eventsPageController.changeIsFetchingEvents(true);
  try {
    final auth = "Bearer ${userModel.token}";
    final response = await http.get(
      "${Config.server_url}:${Config.server_port}/events/user/${userModel.cpf}",
      headers: {"Accept": "application/json", "Authorization": auth},
    );
    print("response body -> ${response.body}");
    if (response.statusCode == 200) {
      print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      final data =
          response.body.isNotEmpty ? convert.jsonDecode(response.body) : null;
      print("data -> $data");
      if (data != null) {
        if (needToReturnData) {
          return data;
        } else {
          final newEvents =
              data.map((element) => {...element, "isFavorited": true}).toList();
          print("NEW EVENTSSSSSS -> $newEvents");
          eventsModel.updateEvents(newEvents);
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
        getEventByCpfUser(context: context, needToReturnData: true)
            .then((resp) {
          if (resp != null && resp.isNotEmpty) {
            final subscribedEventsIds =
                resp.map((element) => element["id"]).toList();
            final newEvents = data
                .map((element) => subscribedEventsIds.contains(element["id"])
                    ? {...element, "isFavorited": true}
                    : {...element, "isFavorited": false})
                .toList();
            print("newEvents -> $newEvents");
            eventsModel.updateEvents(newEvents);
          } else {
            final newEvents = data
                .map((element) => {...element, "isFavorited": false})
                .toList();
            eventsModel.updateEvents(newEvents);
          }
          eventsPageController.changeIsFetchingEvents(false);
        });
      }
    } else {
      final respDecoded = convert.jsonDecode(response.body);
      toast(
        title: "Erro",
        message: respDecoded["message"] ?? "Erro desconhecido.",
        duration: Duration(milliseconds: 2000),
        context: context,
      );
      eventsPageController.changeIsFetchingEvents(false);
    }
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

deleteEvent(BuildContext context, int eventId) async {
  final userModel = Provider.of<User>(context, listen: false);
  try {
    final auth = "Bearer ${userModel.token}";
    final response = await http.delete(
      "${Config.server_url}:${Config.server_port}/events/$eventId",
      headers: {"Accept": "application/json", "Authorization": auth},
    );
    if (response.statusCode == 200) {
      final data =
          response.body.isNotEmpty ? convert.jsonDecode(response.body) : null;
      if (data != null) {
        toast(
          title: "Sucesso",
          message: data["message"] ?? "Evento excluído com sucesso.",
          duration: Duration(milliseconds: 2000),
          context: context,
        );
        fetchEvents(context);
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

void changeFavoritedEvent(BuildContext context, dynamic event, bool isAdding) {
  print("isAdding -> $isAdding");
  final eventsModel = Provider.of<Events>(context, listen: false);
  if (isAdding) {
    createSubscribe(context, event["id"]).then((resp) {
      print("resp creating subscribe -> $resp");
      if (resp != null) {
        event["isFavorited"] = true;
        final newEvents = eventsModel.events
            .map((element) => element["id"] == event["id"] ? event : element)
            .toList();
        print("newEventsList isAdding-> $newEvents");
        eventsModel.updateEvents(newEvents);
      }
    });
  } else {
    deleteSubscribe(context, event["id"]).then((resp) {
      print("resp removing subscribe -> $resp");
      if (resp != null) {
        event["isFavorited"] = false;
        final newEvents = eventsModel.events
            .map((element) => element["id"] == event["id"] ? event : element)
            .toList();
        print("newEventsList isNotAdding -> $newEvents");
        eventsModel.updateEvents(newEvents);
      }
    });
  }
}

deleteSubscribe(BuildContext context, int eventId) async {
  final userModel = Provider.of<User>(context, listen: false);
  try {
    final auth = "Bearer ${userModel.token}";
    final response = await http.delete(
      "${Config.server_url}:${Config.server_port}/subscribes?event_id=$eventId&cpf_user=${userModel.cpf}",
      headers: {"Accept": "application/json", "Authorization": auth},
    );
    print("resp body DELETE SUBSCRIBE -> ${response.body}");
    if (response.statusCode == 200) {
      final data =
          response.body.isNotEmpty ? convert.jsonDecode(response.body) : null;
      if (data != null) {
        toast(
          title: "Sucesso",
          message:
              data["message"] ?? "Participação no evento removida com sucesso.",
          duration: Duration(milliseconds: 2000),
          context: context,
        );
        return data;
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

createSubscribe(BuildContext context, int eventId) async {
  final userModel = Provider.of<User>(context, listen: false);
  try {
    final auth = "Bearer ${userModel.token}";
    final event = {"event_id": eventId.toString(), "cpf_user": userModel.cpf};
    final response = await http.post(
      "${Config.server_url}:${Config.server_port}/subscribes",
      body: convert.jsonEncode(event),
      headers: {
        "Accept": "application/json",
        "Authorization": auth,
        "Content-Type": "application/json",
      },
    );
    print("response body -> ${response.body}");
    if (response.statusCode == 200) {
      final data =
          response.body.isNotEmpty ? convert.jsonDecode(response.body) : null;
      if (data != null) {
        toast(
          title: "Sucesso",
          message: data["message"] ??
              "Participação no evento adicionada com sucesso.",
          duration: Duration(milliseconds: 2000),
          context: context,
        );
        return data;
      }
    } else {
      final respDecoded = convert.jsonDecode(response.body);
      toast(
        title: "Erro",
        message: respDecoded["message"].length > 60
            ? "Erro desconhecido."
            : respDecoded["message"],
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
