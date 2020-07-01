import 'package:congreven_app/actions/events_page_actions.dart';
import 'package:congreven_app/actions/home_page_actions.dart';
import 'package:congreven_app/models/user.dart';
import 'package:congreven_app/pages/enter_page/enter_page_controller.dart';
import 'package:congreven_app/pages/events_page/events_page.dart';
import 'package:congreven_app/pages/home_page/home_page_controller.dart';
import 'package:congreven_app/pages/new_event_page/new_event_page.dart';
import 'package:congreven_app/pages/profile_home_page/profile_home_page.dart';
import 'package:congreven_app/utils/routeTo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Pages {
  static const events = 0;
  static const logout = 1;
  static const profile = 2;
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = Pages.events;

  void initState() {
    super.initState();
    changeIsLoadingApp(context, false);
    fetchEvents(context);
  }

  _handleButtonClicked(int pageSelected) {
    setState(() {
      _selectedPage = pageSelected;
    });
    if (_selectedPage == Pages.events) {
      fetchEvents(context);
    }
  }

  _renderSelectedPage({bool isLoading = false}) {
    switch (_selectedPage) {
      case Pages.events:
        return EventsPage();
      case Pages.logout:
        if (isLoading) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColorDark,
                ),
              ),
            ),
            color: Theme.of(context).backgroundColor,
          );
        } else {
          return EventsPage();
        }
    }
  }

  _navigateAndWaitForResponse(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProfileHomePage()));

    if (result == "needToFetch") {
      fetchEvents(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    double _deviceHeight = MediaQuery.of(context).size.height;
    final userModel = Provider.of<User>(context);
    final enterPageController = Provider.of<EnterPageController>(context);
    final homePageController = Provider.of<HomePageController>(context);
    return Observer(
      builder: (_) {
        return (enterPageController.isLoadingApp)
            ? WillPopScope(
                onWillPop: () async => false,
                child: Scaffold(
                  body: Container(
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ),
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
              )
            : WillPopScope(
                onWillPop: () async => false,
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Theme.of(context).backgroundColor,
                    elevation: 0.0,
                    leading: Builder(
                      builder: (context) {
                        return Container(
                          margin: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 10.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.person_outline,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              if (!homePageController.isLoadingLogout) {
                                _navigateAndWaitForResponse(context);
                              }
                            },
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
                          if (!homePageController.isLoadingLogout) {
                            _handleButtonClicked(Pages.events);
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(0.0, 12.0, 20.0, 12.0),
                          child: Text(
                            "Eventos",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: _selectedPage == Pages.events
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width:
                                    _selectedPage == Pages.events ? 2.0 : 0.0,
                                color: _selectedPage == Pages.events
                                    ? Colors.black
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _handleButtonClicked(Pages.logout);
                          homePageController.changeIsLoadingLogout(true);
                          logoutUser(token: userModel.token, context: context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(0.0, 12.0, 20.0, 12.0),
                          child: Text(
                            "Sair",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: _selectedPage == Pages.logout
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width:
                                    _selectedPage == Pages.logout ? 2.0 : 0.0,
                                color: _selectedPage == Pages.logout
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
                      child: _renderSelectedPage(
                          isLoading: homePageController.isLoadingLogout),
                    ),
                  ),
                  bottomNavigationBar: BottomAppBar(
                    color: Colors.grey[200],
                    child: Container(
                      height: _deviceHeight / 11,
                    ),
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.endDocked,
                  floatingActionButton: Observer(
                    builder: (_) {
                      return FloatingActionButton(
                          onPressed: () {
                            if (!homePageController.isLoadingLogout) {
                              routeTo(context, NewEventPage());
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
                ),
              );
      },
    );
  }
}
