import 'package:congreven_app/actions/new_guest_speaker_page_actions.dart';
import 'package:congreven_app/models/user.dart';
import 'package:congreven_app/pages/activity_details_page/activity_details_page_controller.dart';
import 'package:congreven_app/pages/guest_speaker_home_page/guest_speaker_home_page.dart';
import 'package:congreven_app/pages/my_events_edit_page/my_events_edit_page_controller.dart';
import 'package:congreven_app/pages/new_guest_speaker_forms_page/new_guest_speaker_forms_page_controller.dart';
import 'package:congreven_app/pages/new_guest_speaker_page/new_guest_speaker_page.dart';
import 'package:congreven_app/utils/enter_title.dart';
import 'package:congreven_app/utils/routeTo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class ActivityDetailsPage extends StatefulWidget {
  @override
  _ActivityDetailsPageState createState() => _ActivityDetailsPageState();
}

class _ActivityDetailsPageState extends State<ActivityDetailsPage> {
  DateFormat _dateFormat;

  void initState() {
    super.initState();
    initializeDateFormatting();
    _dateFormat = DateFormat("dd/MM/yyyy", 'pt_BR');
  }

  _renderTextLine({
    String firstLine = "",
    String secondLine = "",
    firstLineSize: 20.0,
    secondLineSize: 14.0,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          firstLine,
          style: TextStyle(
            fontSize: firstLineSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(
          secondLine,
          style: TextStyle(
            fontSize: secondLineSize,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }

  _renderTitleLine({
    BuildContext context,
    String title,
    bool needButton,
    IconData buttonIcon,
    void Function() onPressed,
  }) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Container(
            margin: EdgeInsets.only(right: needButton ? 20.0 : 0.0),
            child: renderEnterTitle(
                firstLine: title, secondLine: "", firstLineSize: 18.0),
          ),
        ),
        needButton
            ? Expanded(
                flex: 1,
                child: Card(
                  color: Theme.of(context).primaryColorDark,
                  child: IconButton(
                    splashColor: Colors.green,
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: onPressed,
                  ),
                ),
              )
            : Container(
                width: 0.0,
                height: 0.0,
              ),
      ],
    );
  }

  _loading() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: Container(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColorDark,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _isEventOwnerToRenderWidget(Widget widget, bool isEventOwner) {
    if (isEventOwner) {
      return widget;
    } else
      return Container(width: 0.0, height: 0.0);
  }

  Widget _renderActivityDetails(dynamic activity, String errorMessage,
      bool isLoading, bool isEventOwner) {
    if (isLoading) {
      return _loading();
    }

    if (activity != null) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Divider(
              color: Colors.black,
              height: 15,
              thickness: 0.15,
              indent: 0,
              endIndent: 0,
            ),
            _renderTextLine(firstLine: "Nome", secondLine: activity["name"]),
            _renderTextLine(
                firstLine: "Período", secondLine: activity["period"]),
            _renderTextLine(
                firstLine: "Data",
                secondLine: _dateFormat
                    .format(DateTime.parse(activity["date_activity"]))),
            _renderTextLine(
                firstLine: "Hora inicial", secondLine: activity["start_hour"]),
            _renderTextLine(
                firstLine: "Hora final", secondLine: activity["end_hour"]),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      );
    } else if (errorMessage.isNotEmpty) {
      return _renderTextLine(secondLine: errorMessage, firstLineSize: 0.0);
    } else
      return Container(
        height: 0.0,
        width: 0.0,
      );
  }

  Widget _renderGuestSpeakerDetails(dynamic guestSpeakers, String errorMessage,
      bool isLoading, bool isEventOwner) {
    final newGuestSpeakerFormsPageController =
        Provider.of<NewGuestSpeakerFormsPageController>(context, listen: false);
    if (isLoading) {
      return _loading();
    }
    if (guestSpeakers.length > 0) {
      final List<Widget> listWidget = List<Widget>();
      for (var element in guestSpeakers) {
        listWidget.add(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Divider(
                color: Colors.black,
                height: 15,
                thickness: 0.15,
                indent: 0,
                endIndent: 0,
              ),
              _renderTextLine(firstLine: "Nome", secondLine: element["name"]),
              _renderTextLine(firstLine: "RG", secondLine: element["rg"]),
              _renderTextLine(
                  firstLine: "Escolaridade", secondLine: element["scholarity"]),
              _renderTextLine(
                  firstLine: "Data de aniversário",
                  secondLine:
                      _dateFormat.format(DateTime.parse(element["bdate"]))),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        );
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: listWidget,
      );
    } else if (errorMessage.isNotEmpty) {
      return _renderTextLine(secondLine: errorMessage, firstLineSize: 0.0);
    } else
      return SizedBox(
        height: 0.0,
      );
  }

  _verifyIsEventOwner({userCpf, eventCpfOwner = ""}) {
    if (userCpf == eventCpfOwner) {
      return true;
    }
    return false;
  }

  bool _verifyActivityNotNull(dynamic activity) {
    if (activity != null) {
      return true;
    }
    return false;
  }

  bool _verifyExistsGuestSpeakers(dynamic activity) {
    if (_verifyActivityNotNull(activity)) {
      final guestSpeakers = activity["guestSpeakers"];
      if (guestSpeakers != null && guestSpeakers.isNotEmpty) {
        return true;
      }
    }
    return false;
  }

  bool _verifyExistisActivity(dynamic activity) {
    if (_verifyActivityNotNull(activity)) {
      final singleActivity = activity["activity"];
      if (singleActivity != null) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final myEventsEditPageController =
        Provider.of<MyEventsEditPageController>(context);
    final userModel = Provider.of<User>(context);
    final activityDetailsPageController =
        Provider.of<ActivityDetailsPageController>(context);
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.white,
            child: Observer(
              builder: (_) {
                return _renderTitleLine(
                  title: "Atividade",
                  needButton: false,
                  context: context,
                );
              },
            ),
          ),
          Container(
            color: Colors.white,
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
            color: Colors.white,
            child: Observer(
              builder: (_) {
                return _renderActivityDetails(
                    _verifyExistisActivity(
                            activityDetailsPageController.activityToUse)
                        ? activityDetailsPageController
                            .activityToUse["activity"]
                        : null,
                    activityDetailsPageController.errorMessage,
                    activityDetailsPageController.isFetchingActivityToUse,
                    _verifyIsEventOwner(
                      userCpf: userModel.cpf,
                      eventCpfOwner:
                          myEventsEditPageController.eventToUse != null
                              ? myEventsEditPageController.eventToUse["event"]
                                  ["cpf_owner"]
                              : "",
                    ));
              },
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.white,
            child: Observer(
              builder: (_) {
                return _renderTitleLine(
                  title: "Palestrantes",
                  context: context,
                  needButton: _verifyIsEventOwner(
                    userCpf: userModel.cpf,
                    eventCpfOwner: myEventsEditPageController.eventToUse != null
                        ? myEventsEditPageController.eventToUse["event"]
                            ["cpf_owner"]
                        : "",
                  ),
                  buttonIcon: Icons.add,
                  onPressed: () {
                    fetchGuestSpeakers(context);
                    routeTo(context, GuestSpeakerHomePage());
                  },
                );
              },
            ),
          ),
          Container(
            color: Colors.white,
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.white,
            child: Observer(
              builder: (_) {
                return _renderGuestSpeakerDetails(
                  _verifyExistsGuestSpeakers(
                          activityDetailsPageController.activityToUse)
                      ? activityDetailsPageController
                          .activityToUse["guestSpeakers"]
                      : [],
                  _verifyExistsGuestSpeakers(
                          activityDetailsPageController.activityToUse)
                      ? ""
                      : "Não há palestrantes para esta atividade ainda.",
                  activityDetailsPageController.isFetchingActivityToUse,
                  _verifyIsEventOwner(
                    userCpf: userModel.cpf,
                    eventCpfOwner: myEventsEditPageController.eventToUse != null
                        ? myEventsEditPageController.eventToUse["event"]
                            ["cpf_owner"]
                        : "",
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }
}
