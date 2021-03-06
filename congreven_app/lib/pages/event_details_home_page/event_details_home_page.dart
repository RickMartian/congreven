import 'package:congreven_app/actions/events_details_page_actions.dart';
import 'package:congreven_app/pages/event_details_page/event_details_page.dart';
import 'package:congreven_app/pages/my_events_edit_page/my_events_edit_page_controller.dart';
import 'package:congreven_app/pages/new_event_forms_page/new_event_forms_page_controller.dart';
import 'package:congreven_app/pages/profile_home_page/profile_home_page.dart';
import 'package:congreven_app/utils/routeTo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Pages {
  static const event_details = 0;
  static const back = 2;
}

class EventDetailsHomePage extends StatefulWidget {
  @override
  _EventDetailsHomePageState createState() => _EventDetailsHomePageState();
}

class _EventDetailsHomePageState extends State<EventDetailsHomePage> {
  int _selectedPage = Pages.event_details;

  _handleButtonClicked(int pageSelected) {
    setState(() {
      _selectedPage = pageSelected;
    });
  }

  _renderSelectedPage({bool isLoading = false}) {
    switch (_selectedPage) {
      case Pages.event_details:
        return EventDetailsPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        cleanAllRelatedToEventDetails(context);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0.0,
          leading: Builder(
            builder: (context) {
              return Container(
                margin: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 10.0),
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      routeTo(context, ProfileHomePage());
                    },
                  ),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              );
            },
          ),
          actions: <Widget>[
            InkWell(
              onTap: () {
                _handleButtonClicked(Pages.event_details);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0.0, 12.0, 20.0, 12.0),
                child: Text(
                  "Detalhes do evento",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: _selectedPage == Pages.event_details
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: _selectedPage == Pages.event_details ? 2.0 : 0.0,
                      color: _selectedPage == Pages.event_details
                          ? Colors.black
                          : Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _handleButtonClicked(Pages.back);
                cleanAllRelatedToEventDetails(context);
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0.0, 12.0, 20.0, 12.0),
                child: Text(
                  "Voltar",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: _selectedPage == Pages.back
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: _selectedPage == Pages.back ? 2.0 : 0.0,
                      color: _selectedPage == Pages.back
                          ? Colors.black
                          : Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Container(
          color: Colors.grey[100],
          child: Container(
            child: _renderSelectedPage(),
          ),
        ),
      ),
    );
  }
}
