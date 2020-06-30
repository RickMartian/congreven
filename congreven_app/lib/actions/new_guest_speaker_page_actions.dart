import 'package:congreven_app/models/guest_speakers.dart';
import 'package:congreven_app/models/user.dart';
import 'package:congreven_app/pages/guest_speaker_page/guest_speaker_page_controller.dart';
import 'package:congreven_app/pages/new_guest_speaker_forms_page/new_guest_speaker_forms_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:congreven_app/config.dart';
import 'package:congreven_app/utils/toast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

cleanNewGuestSpeakerState(BuildContext context) {
  final newGuestSpeakerFormsPageController =
      Provider.of<NewGuestSpeakerFormsPageController>(context, listen: false);
  newGuestSpeakerFormsPageController.clean();
  newGuestSpeakerFormsPageController.changeIsLoadingSomeAction(false);
}

fetchGuestSpeakers(BuildContext context) async {
  final guestSpeakerModel = Provider.of<GuestSpeakers>(context, listen: false);
  final userModel = Provider.of<User>(context, listen: false);
  final guestSpeakerPageController =
      Provider.of<GuestSpeakerPageController>(context, listen: false);
  guestSpeakerPageController.changeIsFetchingGuestSpeaker(true);
  try {
    final auth = "Bearer ${userModel.token}";
    final response = await http.get(
      "${Config.server_url}:${Config.server_port}/guestspeakers",
      headers: {"Accept": "application/json", "Authorization": auth},
    );
    if (response.statusCode == 200) {
      final data =
          response.body.isNotEmpty ? convert.jsonDecode(response.body) : null;
      if (data != null) {
        guestSpeakerModel.updateGuestSpeakers(data);
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
    guestSpeakerPageController.changeIsFetchingGuestSpeaker(false);
  } catch (error) {
    guestSpeakerPageController.changeIsFetchingGuestSpeaker(false);
    toast(
      title: "Erro",
      message:
          "Erro desconhecido. Por favor, reinicie o aplicativo e tente novamente.",
      duration: Duration(milliseconds: 2000),
      context: context,
    );
  }
}

createNewGuestSpeaker(BuildContext context) async {
  final userModel = Provider.of<User>(context, listen: false);
  final newGuestSpeakerFormsPageController =
      Provider.of<NewGuestSpeakerFormsPageController>(context, listen: false);
  newGuestSpeakerFormsPageController.changeIsLoadingSomeAction(true);
  final guestSpeaker =
      newGuestSpeakerFormsPageController.guestSpeakerToRegister;
  try {
    final auth = "Bearer ${userModel.token}";
    final response = await http.post(
      "${Config.server_url}:${Config.server_port}/guestspeakers",
      body: convert.jsonEncode(guestSpeaker),
      headers: {
        "Accept": "application/json",
        "Authorization": auth,
        "Content-Type": "application/json",
      },
    );
    final data =
        response.body.isNotEmpty ? convert.jsonDecode(response.body) : null;
    if (response.statusCode == 200) {
      Navigator.pop(context);
      if (data != null) {
        toast(
          title: "Sucesso!",
          message: data["message"] ?? "Palestrante criado com sucesso!",
          duration: Duration(milliseconds: 2000),
          context: context,
        );
      }
      cleanNewGuestSpeakerState(context);
      fetchGuestSpeakers(context);
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
    newGuestSpeakerFormsPageController.changeIsLoadingSomeAction(false);
  } catch (error) {
    newGuestSpeakerFormsPageController.changeIsLoadingSomeAction(false);
    toast(
      title: "Erro",
      message:
          "Erro desconhecido. Por favor, reinicie o aplicativo e tente novamente.",
      duration: Duration(milliseconds: 2000),
      context: context,
    );
  }
}
