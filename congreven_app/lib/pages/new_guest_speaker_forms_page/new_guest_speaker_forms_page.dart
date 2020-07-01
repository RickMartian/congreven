import 'package:congreven_app/actions/new_organizer_page_actions.dart';
import 'package:congreven_app/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'new_guest_speaker_forms_page_controller.dart';

class NewGuestSpeakerFormsPage extends StatefulWidget {
  @override
  _NewGuestSpeakerFormsPageState createState() =>
      _NewGuestSpeakerFormsPageState();
}

class _NewGuestSpeakerFormsPageState extends State<NewGuestSpeakerFormsPage> {
  final _rgController = MaskedTextController(mask: "00.000.000-0");
  final _dateController = MaskedTextController(mask: "00/00/0000");
  final _nameController = TextEditingController();
  final _scholarityController = TextEditingController();

  void initState() {
    super.initState();
    final newGuestSpeakerFormsPageController =
        Provider.of<NewGuestSpeakerFormsPageController>(context, listen: false);
    if (newGuestSpeakerFormsPageController.isEditting &&
        newGuestSpeakerFormsPageController.guestSpeakerToEdit != null) {
      final guestSpeaker =
          newGuestSpeakerFormsPageController.guestSpeakerToEdit;
      _rgController.text = guestSpeaker["rg"];
      _dateController.text = guestSpeaker["bdate"];
      _nameController.text = guestSpeaker["name"];
      _scholarityController.text = guestSpeaker["scholarity"];
      newGuestSpeakerFormsPageController.changeName(guestSpeaker["name"]);
      newGuestSpeakerFormsPageController.changeDate(guestSpeaker["bdate"]);
      newGuestSpeakerFormsPageController.changeRg(guestSpeaker["rg"]);
      newGuestSpeakerFormsPageController
          .changeScholarity(guestSpeaker["scholarity"]);
    } else {
      _rgController.text = newGuestSpeakerFormsPageController.rg;
      _dateController.text = newGuestSpeakerFormsPageController.date;
    }
  }

  Future<bool> _onWillPop() async {
    cleanNewOrganizerState(context);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final newGuestSpeakerFormsPageController =
        Provider.of<NewGuestSpeakerFormsPageController>(context);
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
                  onChanged: newGuestSpeakerFormsPageController.changeName,
                  errorText: newGuestSpeakerFormsPageController.validateName,
                  controller: _nameController,
                );
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            Observer(
              builder: (_) {
                return renderTextField(
                    labelText: "Rg",
                    onChanged: newGuestSpeakerFormsPageController.changeRg,
                    errorText: newGuestSpeakerFormsPageController.validateRg,
                    controller: _rgController,
                    enabled: !newGuestSpeakerFormsPageController.isEditting);
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            Observer(
              builder: (_) {
                return renderTextField(
                  labelText: "Escolaridade",
                  onChanged:
                      newGuestSpeakerFormsPageController.changeScholarity,
                  errorText:
                      newGuestSpeakerFormsPageController.validateScholarity,
                  controller: _scholarityController,
                );
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            Observer(
              builder: (_) {
                return renderTextField(
                  labelText: "Data de aniversário",
                  onChanged: newGuestSpeakerFormsPageController.changeDate,
                  errorText: newGuestSpeakerFormsPageController.validateDate,
                  controller: _dateController,
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
