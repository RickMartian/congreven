import 'package:congreven_app/interfaces/local_storage_interface.dart';
import 'package:congreven_app/models/activities.dart';
import 'package:congreven_app/models/guest_speakers.dart';
import 'package:congreven_app/models/news.dart';
import 'package:congreven_app/models/user.dart';
import 'package:congreven_app/pages/enter_page/enter_page.dart';
import 'package:congreven_app/pages/enter_page/enter_page_controller.dart';
import 'package:congreven_app/pages/home_page/home_page_controller.dart';
import 'package:congreven_app/pages/login_page/login_page_controller.dart';
import 'package:congreven_app/pages/new_activity_forms_page/new_activity_forms_page_controller.dart';
import 'package:congreven_app/pages/new_event_forms_page/new_event_forms_page_controller.dart';
import 'package:congreven_app/pages/new_guest_speaker_forms_page/new_guest_speaker_forms_page_controller.dart';
import 'package:congreven_app/pages/new_news_forms_page/new_news_forms_page.dart';
import 'package:congreven_app/pages/new_news_forms_page/new_news_forms_page_controller.dart';
import 'package:congreven_app/pages/new_organizer_forms_page/new_organizer_forms_page_controller.dart';
import 'package:congreven_app/pages/register_page/register_page_controller.dart';
import 'package:congreven_app/services/shared_local_storage_service.dart';
import 'package:congreven_app/utils/delay.dart';
import 'package:congreven_app/utils/routeTo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:congreven_app/config.dart';
import 'package:congreven_app/utils/toast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

changeIsLoadingApp(BuildContext context, bool status) {
  final enterPageController =
      Provider.of<EnterPageController>(context, listen: false);
  delayThings(func: () {
    enterPageController.changeIsLoadingApp(false);
  });
}

cleanAll(BuildContext context) {
  final newsModel = Provider.of<News>(context, listen: false);
  final activitiesModel = Provider.of<Activities>(context, listen: false);
  final newActivityFormsPageController =
      Provider.of<NewActivityFormsPageController>(context, listen: false);
  final newEventFormsPageController =
      Provider.of<NewEventFormsPageController>(context, listen: false);
  final loginPageController =
      Provider.of<LoginPageController>(context, listen: false);
  final registerPageController =
      Provider.of<RegisterPageController>(context, listen: false);
  final newGuestSpeakerFormsPageController =
      Provider.of<NewGuestSpeakerFormsPageController>(context, listen: false);
  final newNewsFormsPageController =
      Provider.of<NewNewsFormsPageController>(context, listen: false);
  final newOrganizerFormsPageController =
      Provider.of<NewOrganizerFormsPageController>(context, listen: false);
  final guestSpeakersModel = Provider.of<GuestSpeakers>(context, listen: false);
  newsModel.clean();
  activitiesModel.clean();
  newActivityFormsPageController.clean();
  newEventFormsPageController.clean();
  loginPageController.clean();
  registerPageController.clean();
  newGuestSpeakerFormsPageController.clean();
  newNewsFormsPageController.clean();
  newOrganizerFormsPageController.clean();
  guestSpeakersModel.clean();
}

logoutUser({String token, BuildContext context}) async {
  final userModel = Provider.of<User>(context, listen: false);
  final homePageController =
      Provider.of<HomePageController>(context, listen: false);
  final ILocalStorage storage = SharedLocalStorageService();
  try {
    final response = await http.get(
      "${Config.server_url}:${Config.server_port}/user/logout",
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );
    if (response.statusCode == 401) {
      toast(
        title: "Erro",
        message:
            "Ocorreu um erro ao sair. Por favor, reinicie o aplicativo e tente novamente.",
        duration: Duration(milliseconds: 2000),
        context: context,
      );
    } else {
      userModel.clean();
      storage.delete("userData");
      cleanAll(context);
      routeTo(context, EnterPage());
    }
    homePageController.changeIsLoadingLogout(false);
  } catch (error) {
    homePageController.changeIsLoadingLogout(false);
    toast(
      title: "Erro",
      message:
          "Ocorreu um erro inesperado. Por favor, reinicie o aplicativo e tente novamente.",
      duration: Duration(milliseconds: 2000),
      context: context,
    );
  }
}
