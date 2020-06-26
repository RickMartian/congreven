import 'package:congreven_app/models/events.dart';
import 'package:congreven_app/utils/debouncer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class EventsPage extends StatelessWidget {
  final Debouncer _searchDebouncer = Debouncer(
    delay: Duration(milliseconds: 500),
  );

  void _onChanged(String value) {
    _searchDebouncer.run(() {
      print("value -> $value");
    });
  }

  Widget _itemBuilder(BuildContext context, int index, double deviceHeight,
      double deviceWidth, events) {
    print(events);
    return Card(
      child: Text("Event $index"),
    );
  }

  @override
  Widget build(BuildContext context) {
    final eventsModel = Provider.of<Events>(context);
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
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
          Expanded(
            child: Observer(
              builder: (_) {
                print('eventsModel -> $eventsModel');
                return ListView.builder(
                  itemBuilder: (_, int index) => _itemBuilder(
                    context,
                    index,
                    deviceHeight,
                    deviceWidth,
                    eventsModel.events,
                  ),
                  itemCount: eventsModel.events.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
