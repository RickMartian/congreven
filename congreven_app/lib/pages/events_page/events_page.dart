import 'package:congreven_app/models/events.dart';
import 'package:congreven_app/pages/events_page/events_page_controller.dart';
import 'package:congreven_app/utils/debouncer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final Debouncer _searchDebouncer = Debouncer(
    delay: Duration(milliseconds: 500),
  );
  DateFormat _dateFormat;
  String _search = "";
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

  Widget _renderLine(String title, String value) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(right: 10.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
        ),
        Flexible(
          child: Container(
            child: Text(
              value,
              textAlign: TextAlign.right,
            ),
            alignment: Alignment.bottomRight,
          ),
        )
      ],
    );
  }

  Widget _itemBuilder(BuildContext context, int index, double deviceHeight,
      double deviceWidth, List<dynamic> events) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      color: Theme.of(context).primaryColorLight,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text(
                "${events[index]["name"]}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              _renderLine(
                "Endereço",
                events[index]["address"],
              ),
              SizedBox(
                height: 10.0,
              ),
              _renderLine(
                "Data inicial",
                _dateFormat.format(DateTime.parse(events[index]["start_date"])),
              ),
              SizedBox(
                height: 10.0,
              ),
              _renderLine(
                "Data final",
                _dateFormat.format(DateTime.parse(events[index]["end_date"])),
              ),
              SizedBox(
                height: 10.0,
              ),
              _renderLine(
                "Descrição",
                events[index]["description"],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _filterEventByName(List<dynamic> events) {
    return events.length > 0
        ? events
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
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColorLight,
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
