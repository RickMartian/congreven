import 'package:congreven_app/pages/my_events_edit_page/my_events_edit_page_controller.dart';
import 'package:congreven_app/utils/enter_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class EventDetailsPage extends StatelessWidget {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _renderTextLine(firstLine: "Nome", secondLine: event["event"]["name"]),
        _renderTextLine(
            firstLine: "Endereço", secondLine: event["event"]["address"]),
        _renderTextLine(
            firstLine: "Data inicial",
            secondLine: event["event"]["start_date_formatted"]),
        _renderTextLine(
            firstLine: "Data final",
            secondLine: event["event"]["end_date_formatted"]),
        _renderTextLine(
            firstLine: "Descrição", secondLine: event["event"]["description"]),
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

  _renderTitleLine(
      {BuildContext context,
      String title,
      bool needButton,
      String buttonTitle,
      void Function() onPressed}) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
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
                  child: FlatButton(
                    child: Container(
                      child: Text(buttonTitle),
                    ),
                    onPressed: onPressed,
                    color: Theme.of(context).primaryColorLight,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: organizers
          .map(
            (item) => Column(
              children: <Widget>[
                _renderTextLine(firstLine: "Nome", secondLine: item["name"]),
                _renderTextLine(firstLine: "CNPJ", secondLine: item["cnpj"]),
                _renderTextLine(
                    firstLine: "Descrição", secondLine: item["description"]),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final myEventsEditPageController =
        Provider.of<MyEventsEditPageController>(context);
    print("myEventsEditPageController -> $myEventsEditPageController");
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children: <Widget>[
          Observer(
            builder: (_) {
              return _renderTitleLine(
                title: "Evento",
                needButton: true,
                context: context,
                buttonTitle: "Participar",
                onPressed: () {},
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
            height: 10.0,
          ),
          myEventsEditPageController.eventToUse["organizers"].length > 0
              ? _renderOrganizerDetails(
                  myEventsEditPageController.eventToUse["organizers"])
              : Container(
                  height: 0.0,
                  width: 0.0,
                ),
        ],
      ),
    );
  }
}
