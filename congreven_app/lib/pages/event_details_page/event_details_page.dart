import 'package:congreven_app/actions/events_details_page_actions.dart';
import 'package:congreven_app/models/activities.dart';
import 'package:congreven_app/models/news.dart';
import 'package:congreven_app/models/user.dart';
import 'package:congreven_app/pages/activity_details_home_page/activity_details_home_page.dart';
import 'package:congreven_app/pages/my_events_edit_page/my_events_edit_page_controller.dart';
import 'package:congreven_app/pages/new_activity_page/new_activity_page.dart';
import 'package:congreven_app/pages/new_news_page/new_news_page.dart';
import 'package:congreven_app/utils/enter_title.dart';
import 'package:congreven_app/utils/routeTo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:random_color/random_color.dart';

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
    firstLineSize: 18.0,
    secondLineSize: 16.0,
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

  _renderDescriptionEvent(dynamic event) {
    print("event -> $event");
    if (event != null) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _renderTextLine(
                firstLine: "Descrição",
                secondLine: event["event"]["description"]),
            event["event"]["owner_description"] != null
                ? _renderTextLine(
                    firstLine: "Descrição do criador",
                    secondLine: event["event"]["owner_description"])
                : Container(
                    width: 0.0,
                    height: 0.0,
                  ),
          ],
        ),
      );
    }
    return SizedBox(
      height: 0.0,
    );
  }

  _renderEventDetails(dynamic event) {
    print("event -> $event");
    if (event != null) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              event["event"]["name"],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(Icons.query_builder,
                        size: 18.0, color: Theme.of(context).primaryColorDark),
                  ),
                  TextSpan(
                      text: " " +
                          event["event"]["start_date_formatted"] +
                          " - " +
                          event["event"]["end_date_formatted"],
                      style:
                          TextStyle(color: Colors.grey[600], fontSize: 16.0)),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(Icons.location_on,
                        size: 18.0, color: Theme.of(context).primaryColorDark),
                  ),
                  TextSpan(
                      text: " " + event["event"]["address"],
                      style:
                          TextStyle(color: Colors.grey[600], fontSize: 16.0)),
                ],
              ),
            ),
          ],
        ),
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

  Widget _renderOrganizerDetails(dynamic organizers) {
    final List<Widget> listWidget = List<Widget>();
    RandomColor _randomColor = RandomColor();

    for (var element in organizers) {
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
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundColor: _randomColor.randomColor(
                      colorBrightness: ColorBrightness.light),
                  child: Text(element["name"][0].toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Colors.black)),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      element["name"],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      element["cnpj"],
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      element["description"],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      );
    }
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: listWidget,
      ),
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

  Widget _renderNewsDetails(
      dynamic news, String errorMessage, bool isLoading, bool isEventOwner) {
    print("news to render -> $news");
    print("errorMessage -> $errorMessage");
    if (isLoading) {
      return _loading();
    }
    if (news.length > 0) {
      final List<Widget> listWidget = List<Widget>();
      for (var element in news) {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _renderTextLine(
                      firstLine: "Nome", secondLine: element["name"]),
                  Row(
                    children: <Widget>[
                      _isEventOwnerToRenderWidget(
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            color: Theme.of(context).primaryColorDark,
                            child: IconButton(
                              tooltip: "Editar",
                              splashColor: Colors.green,
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          isEventOwner),
                      SizedBox(
                        width: 5.0,
                      ),
                      _isEventOwnerToRenderWidget(
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            color: Colors.red,
                            child: IconButton(
                              tooltip: "Remover",
                              splashColor: Colors.green,
                              icon: Icon(
                                Icons.delete_outline,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          isEventOwner),
                    ],
                  ),
                ],
              ),
              _renderTextLine(
                  firstLine: "Descrição", secondLine: element["description"]),
              _renderTextLine(
                  firstLine: "Data",
                  secondLine:
                      _dateFormat.format(DateTime.parse(element["ndate"]))),
              SizedBox(
                height: 5.0,
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

  _isEventOwnerToRenderWidget(Widget widget, bool isEventOwner) {
    if (isEventOwner) {
      return widget;
    } else
      return Container(width: 0.0, height: 0.0);
  }

  Widget _renderActivitiesDetails(dynamic activities, String errorMessage,
      bool isLoading, bool isEventOwner) {
    print("activities to render -> $activities");
    print("errorMessage -> $errorMessage");
    if (isLoading) {
      return _loading();
    }
    if (activities.length > 0) {
      final List<Widget> listWidget = List<Widget>();
      for (var element in activities) {
        listWidget.add(
          Container(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _renderTextLine(
                        firstLine: "Nome", secondLine: element["name"]),
                    Row(
                      children: <Widget>[
                        _isEventOwnerToRenderWidget(
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              color: Theme.of(context).primaryColorDark,
                              child: IconButton(
                                tooltip: "Editar",
                                splashColor: Colors.green,
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            isEventOwner),
                        SizedBox(
                          width: 5.0,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          color: Colors.blue,
                          child: IconButton(
                            tooltip: "Detalhes",
                            splashColor: Colors.green,
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              getActivityById(context, element["id"]);
                              routeTo(context, ActivityDetailsHomePage());
                            },
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        _isEventOwnerToRenderWidget(
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              color: Colors.red,
                              child: IconButton(
                                tooltip: "Remover",
                                splashColor: Colors.green,
                                icon: Icon(
                                  Icons.delete_outline,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            isEventOwner),
                      ],
                    ),
                  ],
                ),
                _renderTextLine(
                    firstLine: "Período", secondLine: element["period"]),
                _renderTextLine(
                    firstLine: "Data",
                    secondLine: _dateFormat
                        .format(DateTime.parse(element["date_activity"]))),
                _renderTextLine(
                    firstLine: "Hora inicial",
                    secondLine: element["start_hour"]),
                _renderTextLine(
                    firstLine: "Hora final", secondLine: element["end_hour"]),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
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

  @override
  Widget build(BuildContext context) {
    final myEventsEditPageController =
        Provider.of<MyEventsEditPageController>(context);
    final newsModel = Provider.of<News>(context);
    final activitiesModel = Provider.of<Activities>(context);
    final userModel = Provider.of<User>(context);
    print("myEventsEditPageController -> $myEventsEditPageController");
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.white,
            child: Observer(
              builder: (_) {
                return _renderEventDetails(
                    myEventsEditPageController.eventToUse);
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.white,
            child: Observer(
              builder: (_) {
                return _renderDescriptionEvent(
                    myEventsEditPageController.eventToUse);
              },
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          myEventsEditPageController.eventToUse["organizers"].length > 0
              ? Container(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 0.0),
                  color: Colors.white,
                  child: Observer(
                    builder: (_) {
                      return _renderTitleLine(
                        title: "Sobre os organizadores",
                        needButton: false,
                        context: context,
                      );
                    },
                  ),
                )
              : Container(
                  height: 0.0,
                  width: 0.0,
                ),
          Container(
            color: Colors.white,
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
          Container(
            child: SizedBox(
              height:
                  myEventsEditPageController.eventToUse["organizers"].length > 0
                      ? 15.0
                      : 0.0,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 0.0),
            color: Colors.white,
            child: Observer(
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
                    routeTo(context, NewActivityPage());
                  },
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
                return _renderActivitiesDetails(
                    activitiesModel.activities,
                    activitiesModel.errorMessage,
                    activitiesModel.isFetchingActivities,
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
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
            color: Colors.white,
            child: Observer(
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
                return _renderNewsDetails(
                  newsModel.news,
                  newsModel.errorMessage,
                  newsModel.isFetchingNews,
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
