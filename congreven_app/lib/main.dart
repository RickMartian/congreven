import 'package:congreven_app/models/activities.dart';
import 'package:congreven_app/models/events.dart';
import 'package:congreven_app/models/guest_speakers.dart';
import 'package:congreven_app/models/news.dart';
import 'package:congreven_app/models/organizer.dart';
import 'package:congreven_app/models/user.dart';
import 'package:congreven_app/pages/enter_page/enter_page.dart';
import 'package:congreven_app/pages/enter_page/enter_page_controller.dart';
import 'package:congreven_app/pages/events_page/events_page_controller.dart';
import 'package:congreven_app/pages/home_page/home_page_controller.dart';
import 'package:congreven_app/pages/login_page/login_page_controller.dart';
import 'package:congreven_app/pages/my_account_page/my_account_page_controller.dart';
import 'package:congreven_app/pages/my_events_edit_page/my_events_edit_page_controller.dart';
import 'package:congreven_app/pages/new_activity_forms_page/new_activity_forms_page_controller.dart';
import 'package:congreven_app/pages/new_event_forms_page/new_event_forms_page_controller.dart';
import 'package:congreven_app/pages/new_news_forms_page/new_news_forms_page_controller.dart';
import 'package:congreven_app/pages/new_organizer_forms_page/new_organizer_forms_page_controller.dart';
import 'package:congreven_app/pages/organizer_page/organizer_page_controller.dart';
import 'package:congreven_app/pages/register_page/register_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => LoginPageController(),
        ),
        Provider(
          create: (_) => RegisterPageController(),
        ),
        Provider(
          create: (_) => EnterPageController(),
        ),
        Provider(
          create: (_) => User(),
        ),
        Provider(
          create: (_) => HomePageController(),
        ),
        Provider(
          create: (_) => Events(),
        ),
        Provider(
          create: (_) => NewEventFormsPageController(),
        ),
        Provider(
          create: (_) => EventsPageController(),
        ),
        Provider(
          create: (_) => Organizer(),
        ),
        Provider(
          create: (_) => OrganizerPageController(),
        ),
        Provider(
          create: (_) => NewOrganizerFormsPageController(),
        ),
        Provider(
          create: (_) => MyAccountPageController(),
        ),
        Provider(
          create: (_) => MyEventsEditPageController(),
        ),
        Provider(
          create: (_) => News(),
        ),
        Provider(
          create: (_) => Activities(),
        ),
        Provider(
          create: (_) => GuestSpeakers(),
        ),
        Provider(
          create: (_) => NewNewsFormsPageController(),
        ),
        Provider(
          create: (_) => NewActivityFormsPageController(),
        ),
      ],
      child: MaterialApp(
        title: 'Congreven',
        theme: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            backgroundColor: Colors.white),
        home: EnterPage(),
      ),
    );
  }
}
