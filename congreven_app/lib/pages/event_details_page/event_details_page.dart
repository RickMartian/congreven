import 'package:congreven_app/models/activities.dart';
import 'package:congreven_app/models/news.dart';
import 'package:congreven_app/models/user.dart';
import 'package:congreven_app/pages/my_events_edit_page/my_events_edit_page_controller.dart';
import 'package:congreven_app/pages/new_news_page/new_news_page.dart';
import 'package:congreven_app/utils/enter_title.dart';
import 'package:congreven_app/utils/routeTo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class EventDetailsPage extends StatefulWidget {
  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
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

  _renderEventDetails(dynamic event) {
    print("event -> $event");
    if (event != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _renderTextLine(
              firstLine: "Nome", secondLine: event["event"]["name"]),
          _renderTextLine(
              firstLine: "Endereço", secondLine: event["event"]["address"]),
          _renderTextLine(
              firstLine: "Data inicial",
              secondLine: event["event"]["start_date_formatted"]),
          _renderTextLine(
              firstLine: "Data final",
              secondLine: event["event"]["end_date_formatted"]),
          _renderTextLine(
              firstLine: "Descrição",
              secondLine: event["event"]["description"]),
          event["event"]["owner_description"] != null
              ? _renderTextLine(
                  firstLine: "Data inicial",
                  secondLine: event["event"]["owner_description"])
              : Container(
                  width: 0.0,
                  height: 0.0,
                ),
        ],
      );
    }
    return SizedBox(
      height: 0.0,
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
                firstLine: title, secondLine: "", firstLineSize: 26.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 2.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        needButton
            ? Expanded(
                flex: 1,
                child: Container(
                  child: IconButton(
                    icon: Icon(
                      buttonIcon,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: onPressed,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Theme.of(context).primaryColorDark,
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

  Widget _renderOrganizerDetails(dynamic organizers) {
    final List<Widget> listWidget = List<Widget>();
    for (var element in organizers) {
      listWidget.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _renderTextLine(firstLine: "Nome", secondLine: element["name"]),
            _renderTextLine(firstLine: "CNPJ", secondLine: element["cnpj"]),
            _renderTextLine(
                firstLine: "Descrição", secondLine: element["description"]),
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

  Widget _renderNewsDetails(dynamic news, String errorMessage, bool isLoading) {
    print("news to render -> $news");
    print("errorMessage -> $errorMessage");
    if (isLoading) {
      return _loading();
    }
    if (errorMessage.isNotEmpty) {
      return _renderTextLine(secondLine: errorMessage, firstLineSize: 0.0);
    }
    if (news.length > 0) {
      final List<Widget> listWidget = List<Widget>();
      for (var element in news) {
        listWidget.add(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _renderTextLine(firstLine: "Nome", secondLine: element["name"]),
              _renderTextLine(
                  firstLine: "Descrição", secondLine: element["description"]),
              _renderTextLine(
                  firstLine: "Data",
                  secondLine:
                      _dateFormat.format(DateTime.parse(element["ndate"]))),
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
    } else
      return SizedBox(
        height: 0.0,
      );
  }

  Widget _renderActivitiesDetails(
      dynamic activities, String errorMessage, bool isLoading) {
    print("activities to render -> $activities");
    print("errorMessage -> $errorMessage");
    if (isLoading) {
      return _loading();
    }
    if (errorMessage.isNotEmpty) {
      return _renderTextLine(secondLine: errorMessage, firstLineSize: 0.0);
    }
    if (activities.length > 0) {
      final List<Widget> listWidget = List<Widget>();
      for (var element in activities) {
        listWidget.add(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _renderTextLine(firstLine: "Nome", secondLine: element["name"]),
              _renderTextLine(
                  firstLine: "Período", secondLine: element["period"]),
              _renderTextLine(
                  firstLine: "Data",
                  secondLine: _dateFormat
                      .format(DateTime.parse(element["date_activity"]))),
              _renderTextLine(
                  firstLine: "Hora inicial", secondLine: element["start_hour"]),
              _renderTextLine(
                  firstLine: "Hora final", secondLine: element["end_hour"]),
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

  @override
  Widget build(BuildContext context) {
    final myEventsEditPageController =
        Provider.of<MyEventsEditPageController>(context);
    final newsModel = Provider.of<News>(context);
    final activitiesModel = Provider.of<Activities>(context);
    final userModel = Provider.of<User>(context);
    print("myEventsEditPageController -> $myEventsEditPageController");
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children: <Widget>[
          Observer(
            builder: (_) {
              return _renderTitleLine(
                title: "Evento",
                needButton: false,
                context: context,
                //  buttonTitle: "Participar",
                //onPressed: () {},
              );
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          Observer(
            builder: (_) {
              return _renderEventDetails(myEventsEditPageController.eventToUse);
            },
          ),
          SizedBox(
            height: 15.0,
          ),
          myEventsEditPageController.eventToUse["organizers"].length > 0
              ? Observer(
                  builder: (_) {
                    return _renderTitleLine(
                      title: "Organizadores",
                      needButton: false,
                      context: context,
                    );
                  },
                )
              : Container(
                  height: 0.0,
                  width: 0.0,
                ),
          SizedBox(
            height:
                myEventsEditPageController.eventToUse["organizers"].length > 0
                    ? 10.0
                    : 0.0,
          ),
          myEventsEditPageController.eventToUse["organizers"].length > 0
              ? _renderOrganizerDetails(
                  myEventsEditPageController.eventToUse["organizers"])
              : Container(
                  height: 0.0,
                  width: 0.0,
                ),
          SizedBox(
            height:
                myEventsEditPageController.eventToUse["organizers"].length > 0
                    ? 15.0
                    : 0.0,
          ),
          Observer(
            builder: (_) {
              return _renderTitleLine(
                title: "Atividades",
                needButton: _verifyIsEventOwner(
                  userCpf: userModel.cpf,
                  eventCpfOwner: myEventsEditPageController.eventToUse != null
                      ? myEventsEditPageController.eventToUse["event"]
                          ["cpf_owner"]
                      : "",
                ),
                buttonIcon: Icons.add,
                onPressed: () {
                  print("adicionar atividade nova!");
                },
                context: context,
              );
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          Observer(
            builder: (_) {
              return _renderActivitiesDetails(
                  activitiesModel.activities,
                  activitiesModel.errorMessage,
                  activitiesModel.isFetchingActivities);
            },
          ),
          SizedBox(
            height: 15.0,
          ),
          Observer(
            builder: (_) {
              return _renderTitleLine(
                title: "Notícias",
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
                  print("adicionar noticia nova!");
                  routeTo(context, NewNewsPage());
                },
              );
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          Observer(
            builder: (_) {
              return _renderNewsDetails(newsModel.news, newsModel.errorMessage,
                  newsModel.isFetchingNews);
            },
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }
}
