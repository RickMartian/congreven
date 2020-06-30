import 'package:congreven_app/actions/events_details_page_actions.dart';
import 'package:congreven_app/actions/new_guest_speaker_page_actions.dart';
import 'package:congreven_app/pages/activity_details_page/activity_details_page_controller.dart';
import 'package:congreven_app/pages/guest_speaker_page/guest_speaker_page.dart';
import 'package:congreven_app/pages/guest_speaker_page/guest_speaker_page_controller.dart';
import 'package:congreven_app/pages/my_events_edit_page/my_events_edit_page_controller.dart';
import 'package:congreven_app/pages/new_guest_speaker_page/new_guest_speaker_page.dart';
import 'package:congreven_app/pages/profile_home_page/profile_home_page.dart';
import 'package:congreven_app/utils/routeTo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Pages {
  static const guest_speakers = 0;
  static const back = 1;
  static const profile = 2;
}

class GuestSpeakerHomePage extends StatefulWidget {
  @override
  _GuestSpeakerHomePageState createState() => _GuestSpeakerHomePageState();
}

class _GuestSpeakerHomePageState extends State<GuestSpeakerHomePage> {
  int _selectedPage = 0;

  _handleButtonClicked(int pageSelected) {
    setState(() {
      _selectedPage = pageSelected;
    });
  }

  _renderSelectedPage() {
    switch (_selectedPage) {
      case Pages.guest_speakers:
        return GuestSpeakerPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final guestSpeakerPageController =
        Provider.of<GuestSpeakerPageController>(context);
    final activityDetailsPageController =
        Provider.of<ActivityDetailsPageController>(context);
    final deviceHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        getActivityById(
          context,
          activityDetailsPageController.activityToUse != null
              ? activityDetailsPageController.activityToUse["activity"]["id"]
              : 0,
        );
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
                      if (!guestSpeakerPageController.isFetchingGuestSpeaker) {
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
                if (!guestSpeakerPageController.isFetchingGuestSpeaker) {
                  _handleButtonClicked(Pages.guest_speakers);
                  fetchGuestSpeakers(context);
                }
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0.0, 12.0, 20.0, 12.0),
                child: Text(
                  "Palestrantes",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: _selectedPage == Pages.guest_speakers
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: _selectedPage == Pages.guest_speakers ? 2.0 : 0.0,
                      color: _selectedPage == Pages.guest_speakers
                          ? Colors.black
                          : Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (!guestSpeakerPageController.isFetchingGuestSpeaker) {
                  _handleButtonClicked(Pages.back);
                  getActivityById(
                    context,
                    activityDetailsPageController.activityToUse != null
                        ? activityDetailsPageController
                            .activityToUse["activity"]["id"]
                        : 0,
                  );
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
                  if (!guestSpeakerPageController.isFetchingGuestSpeaker) {
                    routeTo(context, NewGuestSpeakerPage());
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
  }
}
