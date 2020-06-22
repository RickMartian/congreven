import 'package:congreven_app/pages/enter_page/enter_page.dart';
import 'package:congreven_app/pages/login_page/login_page_controller.dart';
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
      ],
      child: MaterialApp(
        title: 'Congreven',
        theme: ThemeData(
            primarySwatch: Colors.pink,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            backgroundColor: Colors.white),
        home: EnterPage(),
      ),
    );
  }
}
