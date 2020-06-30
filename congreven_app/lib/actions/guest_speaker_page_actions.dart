import 'package:congreven_app/models/user.dart';
import 'package:congreven_app/pages/activity_details_page/activity_details_page_controller.dart';
import 'package:congreven_app/pages/guest_speaker_page/guest_speaker_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:congreven_app/config.dart';
import 'package:congreven_app/utils/toast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

createSpeak(int activityId, String rg, String auth) async {
  final body = {"activity_id": activityId, "rg_guest_speaker": rg};
  print("body -> $body");
  final response = await http.post(
    "${Config.server_url}:${Config.server_port}/speaks",
    body: convert.jsonEncode(body),
    headers: {
      "Accept": "application/json",
      "Authorization": auth,
      "Content-Type": "application/json"
    },
  );
  return response;
}

deleteSpeak(int activityId, String rg, String auth) async {
  final response = await http.delete(
    "${Config.server_url}:${Config.server_port}/speaks?activity_id=$activityId&rg_guest_speaker=$rg",
    headers: {
      "Accept": "application/json",
      "Authorization": auth,
    },
  );
  return response;
}

selectGuestSpeaker(BuildContext context, dynamic guestSpeaker) {
  print("GUEST SPEAKER TO LINK TO EVENT! -> $guestSpeaker");
  final activityDetailsPageController =
      Provider.of<ActivityDetailsPageController>(context, listen: false);
  final userModel = Provider.of<User>(context, listen: false);
  final guestSpeakerPageController =
      Provider.of<GuestSpeakerPageController>(context, listen: false);
  final auth = "Bearer ${userModel.token}";
  print("eventToUse -> ${activityDetailsPageController.activityToUse}");
  try {
    createSpeak(
      activityDetailsPageController.activityToUse["activity"]["id"],
      guestSpeaker["rg"],
      auth,
    ).then((response) {
      print("response -> $response");
      print("response statusCode-> ${response.statusCode}");
      print("response body -> ${response.body}");
      final data =
          response.body.isNotEmpty ? convert.jsonDecode(response.body) : null;
      if (response.statusCode == 200) {
        if (data != null) {
          guestSpeakerPageController.addSelectedGuestSpeaker(guestSpeaker);
          toast(
            title: "Sucesso!",
            message: data["message"] ??
                "Palestrante vinculado a atividade com sucesso.",
            duration: Duration(milliseconds: 2000),
            context: context,
          );
        }
      } else {
        if (data != null) {
          toast(
            title: "Erro",
            message: data["message"] ?? "Erro desconhecido.",
            duration: Duration(milliseconds: 2000),
            context: context,
          );
        }
      }
    });
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

removeSelectedGuestSpeaker(BuildContext context, dynamic guestSpeaker) {
  print("remove guest speaker !! -> $guestSpeaker");
  final activityDetailsPageController =
      Provider.of<ActivityDetailsPageController>(context, listen: false);
  final guestSpeakerPageController =
      Provider.of<GuestSpeakerPageController>(context, listen: false);
  final userModel = Provider.of<User>(context, listen: false);
  final auth = "Bearer ${userModel.token}";
  try {
    deleteSpeak(activityDetailsPageController.activityToUse["activity"]["id"],
            guestSpeaker["rg"], auth)
        .then((response) {
      print("response -> $response");
      print("response statusCode-> ${response.statusCode}");
      print("response body -> ${response.body}");
      final data =
          response.body.isNotEmpty ? convert.jsonDecode(response.body) : null;
      if (response.statusCode == 200) {
        if (data != null) {
          guestSpeakerPageController.removeSelectedGuestSpeaker(guestSpeaker);
          toast(
            title: "Sucesso!",
            message: data["message"] ??
                "Palestrante removido da atividade com sucesso.",
            duration: Duration(milliseconds: 2000),
            context: context,
          );
        }
      } else {
        if (data != null) {
          toast(
            title: "Erro",
            message: data["message"] ?? "Erro desconhecido.",
            duration: Duration(milliseconds: 2000),
            context: context,
          );
        }
      }
    });
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
