import 'package:congreven_app/actions/events_page_actions.dart';
import 'package:congreven_app/actions/my_account_page_actions.dart';
import 'package:congreven_app/pages/events_page/events_page.dart';
import 'package:congreven_app/pages/my_account_page/my_account_page.dart';
import 'package:congreven_app/pages/my_account_page/my_account_page_controller.dart';
import 'package:congreven_app/pages/new_event_page/new_event_page.dart';
import 'package:congreven_app/utils/routeTo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Pages {
  static const my_account = 0;
  static const my_events = 1;
  static const back = 2;
  static const subscribed = 3;
}

class ProfileHomePage extends StatefulWidget {
  @override
  _ProfileHomePageState createState() => _ProfileHomePageState();
}

class _ProfileHomePageState extends State<ProfileHomePage> {
  int _selectedPage = Pages.my_account;

  _handleButtonClicked(int pageSelected) {
    setState(() {
      _selectedPage = pageSelected;
    });
  }

  _renderSelectedPage({bool isLoading = false}) {
    switch (_selectedPage) {
      case Pages.my_events:
        return EventsPage();
      case Pages.my_account:
        return MyAccountPage();
      case Pages.subscribed:
        return EventsPage();
    }
  }

  _isSelectedPage(int page) {
    if (page == _selectedPage) {
      return true;
    } else
      return false;
  }

  _renderIcon({bool isLoading = false}) {
    if (isLoading) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    }
    if (_isSelectedPage(Pages.my_account)) {
      return Icon(
        Icons.arrow_forward,
        color: Colors.white,
      );
    } else if (_isSelectedPage(Pages.my_events)) {
      return Icon(
        Icons.add,
        color: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double _deviceHeight = MediaQuery.of(context).size.height;
    final myAccountPageController =
        Provider.of<MyAccountPageController>(context);
    return Observer(
      builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            Navigator.pop(context, "needToFetch");
            return false;
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
                      child: Icon(
                        Icons.person_outline,
                        color: Colors.white,
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
                    if (!myAccountPageController.isLoadingSomeAction) {
                      _handleButtonClicked(Pages.my_account);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(0.0, 12.0, 10.0, 12.0),
                    child: Text(
                      "Minha conta",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: _selectedPage == Pages.my_account
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: _selectedPage == Pages.my_account ? 2.0 : 0.0,
                          color: _selectedPage == Pages.my_account
                              ? Colors.black
                              : Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (!myAccountPageController.isLoadingSomeAction) {
                      getEventByCpfUser(context: context);
                      _handleButtonClicked(Pages.my_events);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(0.0, 12.0, 10.0, 12.0),
                    child: Text(
                      "Meus eventos",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: _selectedPage == Pages.my_events
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: _selectedPage == Pages.my_events ? 2.0 : 0.0,
                          color: _selectedPage == Pages.my_events
                              ? Colors.black
                              : Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (!myAccountPageController.isLoadingSomeAction) {
                      Navigator.pop(context, "needToFetch");
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
                height: _deviceHeight / 11,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            floatingActionButton: Observer(
              builder: (_) {
                return FloatingActionButton(
                    onPressed: () {
                      if (!myAccountPageController.isLoadingSomeAction) {
                        if (_isSelectedPage(Pages.my_events)) {
                          routeTo(context, NewEventPage());
                        } else if (_isSelectedPage(Pages.my_account)) {
                          if (verifyIsValidToUpdateUser(context)) {
                            updateUser(context);
                          }
                        }
                      }
                    },
                    backgroundColor: Theme.of(context).primaryColorDark,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: _renderIcon(
                        isLoading:
                            myAccountPageController.isLoadingSomeAction));
              },
            ),
          ),
        );
      },
    );
  }
}
