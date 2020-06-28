import 'package:congreven_app/actions/new_event_page_actions.dart';
import 'package:congreven_app/pages/new_event_forms_page/new_event_forms_page.dart';
import 'package:congreven_app/pages/new_event_forms_page/new_event_forms_page_controller.dart';
import 'package:congreven_app/pages/profile_page/profile_page.dart';
import 'package:congreven_app/utils/routeTo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Pages {
  static const new_event = 0;
  static const profile = 1;
  static const back = 2;
}

class NewEventPage extends StatefulWidget {
  @override
  _NewEventPageState createState() => _NewEventPageState();
}

class _NewEventPageState extends State<NewEventPage> {
  int _selectedPage = Pages.new_event;

  _handleButtonClicked(int pageSelected) {
    setState(() {
      _selectedPage = pageSelected;
    });
  }

  _renderSelectedPage({bool isLoading = false}) {
    switch (_selectedPage) {
      case Pages.profile:
        return ProfilePage();
      case Pages.new_event:
        return NewEventFormsPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    double _deviceHeight = MediaQuery.of(context).size.height;
    final newEventFormsPageController =
        Provider.of<NewEventFormsPageController>(context);
    return Scaffold(
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
                    cleanNewEventState(context);
                    _handleButtonClicked(Pages.profile);
                  },
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(8.0),
              ),
            );
          },
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {
              _handleButtonClicked(Pages.new_event);
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0.0, 12.0, 20.0, 12.0),
              child: Text(
                "Novo evento",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: _selectedPage == Pages.new_event
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: _selectedPage == Pages.new_event ? 2.0 : 0.0,
                    color: _selectedPage == Pages.new_event
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
              Navigator.pop(context);
              cleanNewEventState(context);
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
        color: Theme.of(context).backgroundColor,
        child: Container(
          child: _renderSelectedPage(),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[300],
        child: Container(
          height: _deviceHeight / 11,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Observer(
        builder: (_) {
          return FloatingActionButton(
            onPressed: () {
              if (!newEventFormsPageController.isLoadingSomeAction &&
                  newEventFormsPageController.isValid) {
                createNewEvent(context);
              }
            },
            backgroundColor: Theme.of(context).primaryColorLight,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: !newEventFormsPageController.isLoadingSomeAction
                ? Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                : CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
          );
        },
      ),
    );
  }
}
