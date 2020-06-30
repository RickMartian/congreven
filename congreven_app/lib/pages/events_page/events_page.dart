import 'package:congreven_app/actions/events_details_page_actions.dart';
import 'package:congreven_app/actions/events_page_actions.dart';
import 'package:congreven_app/models/events.dart';
import 'package:congreven_app/pages/event_details_home_page/event_details_home_page.dart';
import 'package:congreven_app/pages/events_page/events_page_controller.dart';
import 'package:congreven_app/pages/my_events_edit_page/my_events_edit_page_controller.dart';
import 'package:congreven_app/pages/new_event_page/new_event_page.dart';
import 'package:congreven_app/utils/debouncer.dart';
import 'package:congreven_app/utils/routeTo.dart';
import 'package:congreven_app/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

class EventsPage extends StatefulWidget {
  final cpfOwner;
  EventsPage({this.cpfOwner = ""});

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final Debouncer _searchDebouncer = Debouncer(
    delay: Duration(milliseconds: 500),
  );
  DateFormat _dateFormat;
  String _search = "";
  int _eventIdClicked;
  void initState() {
    super.initState();
    initializeDateFormatting();
    _dateFormat = DateFormat("dd/MM/yyyy", 'pt_BR');
  }

  void _onChanged(String value) {
    _searchDebouncer.run(() {
      setState(() {
        _search = value;
      });
    });
  }

  Widget _renderEditButton(eventCpfOwner, event) {
    final myEventsEditPageController =
        Provider.of<MyEventsEditPageController>(context, listen: false);
    final eventsPageController =
        Provider.of<EventsPageController>(context, listen: false);
    if (verifyIsCpfOwner(eventCpfOwner)) {
      return FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        onPressed: () {
          setState(() {
            _eventIdClicked = event["id"];
          });
          try {
            getEventById(context, event["id"]).then((response) {
              setState(() {
                _eventIdClicked = null;
              });
              response["event"]["start_date_formatted"] = _dateFormat
                  .format(DateTime.parse(response["event"]["start_date"]));
              response["event"]["end_date_formatted"] = _dateFormat
                  .format(DateTime.parse(response["event"]["end_date"]));
              myEventsEditPageController.changeEventToUse(response);
              routeTo(context, NewEventPage());
            });
          } catch (error) {
            setState(() {
              _eventIdClicked = null;
            });
            toast(
              title: "Erro",
              message:
                  "Não foi possível selecionar o evento a ser editado. Por favor, reinicie o aplicativo e tente novamente.",
              duration: Duration(milliseconds: 3000),
              context: context,
            );
          }
        },
        child: eventsPageController.isFetchingEventById &&
                _eventIdClicked == event["id"]
            ? Container(
                padding: EdgeInsets.all(4.0),
                child: Flexible(
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColorDark,
                      ),
                    ),
                  ),
                ),
              )
            : Container(
                padding: EdgeInsets.all(4.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child:
                            Icon(Icons.create, size: 18.0, color: Colors.white),
                      ),
                      TextSpan(
                          text: " EDITAR",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
        color: Colors.green,
      );
    }
    return SizedBox(
      height: 0.0,
    );
  }

  bool verifyIsCpfOwner(eventCpfOwner) {
    if (eventCpfOwner == widget.cpfOwner) {
      return true;
    }
    return false;
  }

  Widget _itemBuilder(BuildContext context, int index, double deviceHeight,
      double deviceWidth, List<dynamic> events) {
    final myEventsEditPageController =
        Provider.of<MyEventsEditPageController>(context, listen: false);
    return Column(
      children: <Widget>[
        Card(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
          color: Colors.white,
          elevation: 0,
          child: InkWell(
            onTap: () {
              try {
                getEventById(context, events[index]["id"]).then((response) {
                  response["event"]["start_date_formatted"] = _dateFormat
                      .format(DateTime.parse(response["event"]["start_date"]));
                  response["event"]["end_date_formatted"] = _dateFormat
                      .format(DateTime.parse(response["event"]["end_date"]));
                  myEventsEditPageController.changeEventToUse(response);
                  getNewsByEventId(context, response["event"]["id"]);
                  getActivityByEventId(context, response["event"]["id"]);
                  routeTo(context, EventDetailsHomePage());
                });
              } catch (error) {
                toast(
                  title: "Erro",
                  message:
                      "Não foi possível selecionar o evento a ser visualizado. Por favor, reinicie o aplicativo e tente novamente.",
                  duration: Duration(milliseconds: 3000),
                  context: context,
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "${_dateFormat.format(DateTime.parse(events[index]["start_date"]))}",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.red[300],
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "${events[index]["name"]}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "${events[index]["description"]}",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.location_on,
                              size: 18.0,
                              color: Theme.of(context).primaryColorDark),
                        ),
                        TextSpan(
                            text: "${events[index]["address"]}",
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 16.0)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Observer(builder: (_) {
                    return Row(
                      children: <Widget>[
                        Expanded(
                            child: _renderEditButton(
                                events[index]["cpf_owner"], events[index])),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
        Divider(
          color: Colors.black,
          height: 15,
          thickness: 0.25,
          indent: 0,
          endIndent: 0,
        ),
      ],
    );
  }

  List<dynamic> _filterEventByCpfOwner(List<dynamic> events) {
    return widget.cpfOwner.isNotEmpty
        ? events
            .where((element) => element["cpf_owner"] == widget.cpfOwner)
            .toList()
        : events;
  }

  List<dynamic> _filterEventByName(List<dynamic> events) {
    return events.length > 0
        ? _filterEventByCpfOwner(events)
            .where((element) =>
                element["name"].toLowerCase().startsWith(_search.toLowerCase()))
            .toList()
        : events;
  }

  @override
  Widget build(BuildContext context) {
    final eventsModel = Provider.of<Events>(context);
    final eventsPageController = Provider.of<EventsPageController>(context);
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
            child: TextField(
              onChanged: (value) {
                _onChanged(value);
              },
              decoration: InputDecoration(
                labelText: "Pesquisar",
                labelStyle: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).accentColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Observer(
              builder: (_) {
                return !eventsPageController.isFetchingEvents
                    ? _filterEventByName(eventsModel.events).length > 0
                        ? ListView.builder(
                            itemBuilder: (_, int index) => _itemBuilder(
                                context,
                                index,
                                deviceHeight,
                                deviceWidth,
                                _filterEventByName(eventsModel.events)),
                            itemCount:
                                _filterEventByName(eventsModel.events).length,
                          )
                        : Container(
                            margin: EdgeInsets.all(10.0),
                            child: Text("Não há evento."),
                          )
                    : Container(
                        margin: EdgeInsets.all(10.0),
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColorDark,
                          ),
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
