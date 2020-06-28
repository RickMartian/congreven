import 'package:congreven_app/actions/new_organizer_page_actions.dart';
import 'package:congreven_app/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'new_organizer_forms_page_controller.dart';

class NewOrganizerFormsPage extends StatefulWidget {
  @override
  _NewOrganizerFormsPageState createState() => _NewOrganizerFormsPageState();
}

class _NewOrganizerFormsPageState extends State<NewOrganizerFormsPage> {
  final _cnpjController = MaskedTextController(mask: "00.000.000/0000-00");
  Future<bool> _onWillPop() async {
    cleanNewOrganizerState(context);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final newOrganizerFormsPageController =
        Provider.of<NewOrganizerFormsPageController>(context);
    _cnpjController.text = newOrganizerFormsPageController.cnpj;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        padding: EdgeInsets.only(top: 10.0),
        child: ListView(
          children: <Widget>[
            Observer(
              builder: (_) {
                return renderTextField(
                  labelText: "Nome",
                  onChanged: newOrganizerFormsPageController.changeName,
                  errorText: newOrganizerFormsPageController.validateName,
                );
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            Observer(
              builder: (_) {
                return renderTextField(
                  labelText: "Cnpj",
                  onChanged: newOrganizerFormsPageController.changeCnpj,
                  errorText: newOrganizerFormsPageController.validateCnpj,
                  controller: _cnpjController,
                  keyboardType: TextInputType.number,
                );
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            Observer(
              builder: (_) {
                return renderTextField(
                  labelText: "Descrição",
                  onChanged: newOrganizerFormsPageController.changeDescription,
                  errorText:
                      newOrganizerFormsPageController.validateDescription,
                );
              },
            ),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
