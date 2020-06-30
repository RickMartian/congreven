import 'package:congreven_app/actions/new_news_page_actions.dart';
import 'package:congreven_app/pages/my_events_edit_page/my_events_edit_page_controller.dart';
import 'package:congreven_app/pages/new_news_forms_page/new_news_forms_page.dart';
import 'package:congreven_app/pages/new_news_forms_page/new_news_forms_page_controller.dart';
import 'package:congreven_app/pages/profile_home_page/profile_home_page.dart';
import 'package:congreven_app/utils/routeTo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Pages {
  static const new_news = 0;
  static const profile = 1;
  static const back = 2;
}

class NewNewsPage extends StatefulWidget {
  @override
  _NewNewsPageState createState() => _NewNewsPageState();
}

class _NewNewsPageState extends State<NewNewsPage> {
  int _selectedPage = Pages.new_news;

  _handleButtonClicked(int pageSelected) {
    setState(() {
      _selectedPage = pageSelected;
    });
  }

  _renderSelectedPage({bool isLoading = false}) {
    switch (_selectedPage) {
      case Pages.new_news:
        return NewNewsFormsPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    double _deviceHeight = MediaQuery.of(context).size.height;
    final newNewsFormsPageController =
        Provider.of<NewNewsFormsPageController>(context);
    final myEventsEditPageController =
        Provider.of<MyEventsEditPageController>(context);
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
                    cleanNewNewsState(context);
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
              _handleButtonClicked(Pages.new_news);
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0.0, 12.0, 20.0, 12.0),
              child: Text(
                "Nova notícia",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: _selectedPage == Pages.new_news
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: _selectedPage == Pages.new_news ? 2.0 : 0.0,
                    color: _selectedPage == Pages.new_news
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
              cleanNewNewsState(context);
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Observer(
        builder: (_) {
          return FloatingActionButton(
            onPressed: () {
              if (!newNewsFormsPageController.isLoadingSomeAction &&
                  newNewsFormsPageController.isValid) {
                // if (myEventsEditPageController.eventToUse != null) {
                //   updateEvent(context);
                // } else {
                createNewNews(
                  context,
                  myEventsEditPageController.eventToUse != null
                      ? myEventsEditPageController.eventToUse["event"]["id"]
                      : 0,
                );
                // }
              }
            },
            backgroundColor: Theme.of(context).primaryColorDark,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: !newNewsFormsPageController.isLoadingSomeAction
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
