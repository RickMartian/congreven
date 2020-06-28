import 'package:congreven_app/actions/new_event_page_actions.dart';
import 'package:congreven_app/actions/organizer_page_actions.dart';
import 'package:congreven_app/components/text_field.dart';
import 'package:congreven_app/pages/my_events_edit_page/my_events_edit_page_controller.dart';
import 'package:congreven_app/pages/new_event_forms_page/new_event_forms_page_controller.dart';
import 'package:congreven_app/pages/organizer_home_page/organizer_home_page.dart';
import 'package:congreven_app/utils/routeTo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class NewEventFormsPage extends StatefulWidget {
  @override
  _NewEventFormsPageState createState() => _NewEventFormsPageState();
}

class _NewEventFormsPageState extends State<NewEventFormsPage> {
  final MaskedTextController _startDateController =
      MaskedTextController(mask: "00/00/0000");
  final MaskedTextController _endDateController =
      MaskedTextController(mask: "00/00/0000");
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _ownerDescriptionController = TextEditingController();

  void initState() {
    super.initState();
    final newEventFormsPageController =
        Provider.of<NewEventFormsPageController>(context, listen: false);
    final myEventsEditPageController =
        Provider.of<MyEventsEditPageController>(context, listen: false);
    print("EVENT TO EDIT -> ${myEventsEditPageController.eventToEdit}");
    final eventToEdit = myEventsEditPageController.eventToEdit;
    if (eventToEdit == null) {
      _startDateController.text = newEventFormsPageController.startDate;
      _endDateController.text = newEventFormsPageController.endDate;
    }
    if (eventToEdit != null) {
      _nameController.text = eventToEdit["name"];
      _addressController.text = eventToEdit["address"];
      _startDateController.text = eventToEdit["start_date_formatted"];
      _endDateController.text = eventToEdit["end_date_formatted"];
      _descriptionController.text = eventToEdit["description"];
      _ownerDescriptionController.text = eventToEdit["owner_description"];
      newEventFormsPageController.changeName(eventToEdit["name"]);
      newEventFormsPageController.changeAddress(eventToEdit["address"]);
      newEventFormsPageController.changeDescription(eventToEdit["description"]);
      newEventFormsPageController
          .changeOwnerDescription(eventToEdit["owner_description"]);
      newEventFormsPageController
          .changeStartDate(eventToEdit["start_date_formatted"]);
      newEventFormsPageController
          .changeEndDate(eventToEdit["end_date_formatted"]);
      if (eventToEdit["owner_description"] == null || eventToEdit.isEmpty) {
        newEventFormsPageController.changeIsOwner(false);
      }
      // TODO: fazer GET para buscar organizadores relacionado ao evento a ser editado!
    }
  }

  _handleIsOwner(newEventFormsPageController) {
    if (newEventFormsPageController.isOwner) {
      return renderTextField(
        labelText: "Descrição do proprietário",
        onChanged: newEventFormsPageController.changeOwnerDescription,
        errorText: newEventFormsPageController.validateOwnerDescription,
        controller: _ownerDescriptionController,
      );
    } else {
      final List<dynamic> organizers =
          newEventFormsPageController.selectedOrganizers;
      print("organizers new event forms -> $organizers");
      return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          FlatButton(
            color: Theme.of(context).primaryColorLight,
            onPressed: () {
              fetchOrganizers(context);
              routeTo(context, OrganizerHomePage());
            },
            child: Container(
              child: Text("Selecionar o(s) organizador(es)"),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            "Organizadores selecionados: ",
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          organizers != null && organizers.length > 0
              ? ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                    child: Text(
                      organizers[index]["name"],
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    margin: EdgeInsets.only(
                        bottom: organizers != null
                            ? organizers.length == index + 1 ? 0.0 : 10.0
                            : 10.0),
                  ),
                  itemCount: organizers != null ? organizers.length : 0,
                )
              : ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: <Widget>[
                    Text(
                      "Ainda não foi selecionado nenhum organizador.",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Pelo menos um organizador é necessário!",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
        ],
      );
    }
  }

  Future<bool> _onWillPop() async {
    cleanNewEventState(context);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final newEventFormsPageController =
        Provider.of<NewEventFormsPageController>(context);
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
                  onChanged: newEventFormsPageController.changeName,
                  errorText: newEventFormsPageController.validateName,
                  controller: _nameController,
                );
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Observer(builder: (_) {
                  return Checkbox(
                    activeColor: Theme.of(context).primaryColorLight,
                    onChanged: (bool value) {
                      newEventFormsPageController.changeIsOwner(value);
                    },
                    value: newEventFormsPageController.isOwner,
                  );
                }),
                Text(
                  "Eu sou o proprietário do evento",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
            Observer(
              builder: (_) {
                return _handleIsOwner(newEventFormsPageController);
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            Observer(
              builder: (_) {
                return renderTextField(
                  labelText: "Endereço",
                  onChanged: newEventFormsPageController.changeAddress,
                  errorText: newEventFormsPageController.validateAddress,
                  controller: _addressController,
                );
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            Observer(
              builder: (_) {
                return renderTextField(
                  labelText: "Data inicial",
                  onChanged: newEventFormsPageController.changeStartDate,
                  errorText: newEventFormsPageController.validateStartDate,
                  controller: _startDateController,
                );
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            Observer(
              builder: (_) {
                return renderTextField(
                  labelText: "Data final",
                  onChanged: newEventFormsPageController.changeEndDate,
                  errorText: newEventFormsPageController.validateEndDate,
                  controller: _endDateController,
                );
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            Observer(
              builder: (_) {
                return renderTextField(
                  labelText: "Descrição do evento",
                  onChanged: newEventFormsPageController.changeDescription,
                  errorText: newEventFormsPageController.validateDescription,
                  controller: _descriptionController,
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
