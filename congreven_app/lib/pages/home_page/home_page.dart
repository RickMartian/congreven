import 'package:congreven_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<User>(context);
    print("user model -> $userModel");
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("HOME PAGE!!"),
        ),
      ),
    );
  }
}
