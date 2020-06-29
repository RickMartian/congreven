import 'package:congreven_app/actions/organizer_page_actions.dart';
import 'package:congreven_app/pages/new_organizer_page/new_organizer_page.dart';
import 'package:congreven_app/pages/organizer_page/organizer_page.dart';
import 'package:congreven_app/pages/organizer_page/organizer_page_controller.dart';
import 'package:congreven_app/pages/profile_home_page/profile_home_page.dart';
import 'package:congreven_app/utils/routeTo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Pages {
  static const organizers = 0;
  static const back = 1;
  static const profile = 2;
}

class OrganizerHomePage extends StatefulWidget {
  @override
  _OrganizerHomePageState createState() => _OrganizerHomePageState();
}

class _OrganizerHomePageState extends State<OrganizerHomePage> {
  int _selectedPage = 0;

  _handleButtonClicked(int pageSelected) {
    setState(() {
      _selectedPage = pageSelected;
    });
  }

  _renderSelectedPage() {
    switch (_selectedPage) {
      case Pages.organizers:
        return OrganizerPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final organizerPageController =
        Provider.of<OrganizerPageController>(context);
    final deviceHeight = MediaQuery.of(context).size.height;
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
                    if (!organizerPageController.isFetchingOrganizer) {
                      routeTo(context, ProfileHomePage());
                    }
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
              if (!organizerPageController.isFetchingOrganizer) {
                _handleButtonClicked(Pages.organizers);
                fetchOrganizers(context);
              }
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0.0, 12.0, 20.0, 12.0),
              child: Text(
                "Organizadores",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: _selectedPage == Pages.organizers
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: _selectedPage == Pages.organizers ? 2.0 : 0.0,
                    color: _selectedPage == Pages.organizers
                        ? Colors.black
                        : Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (!organizerPageController.isFetchingOrganizer) {
                _handleButtonClicked(Pages.back);
                Navigator.pop(context);
              }
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
        color: Colors.grey[200],
        child: Container(
          height: deviceHeight / 11,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Observer(
        builder: (_) {
          return FloatingActionButton(
              onPressed: () {
                if (!organizerPageController.isFetchingOrganizer) {
                  routeTo(context, NewOrganizerPage());
                }
              },
              backgroundColor: Theme.of(context).primaryColorDark,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ));
        },
      ),
    );
  }
}
